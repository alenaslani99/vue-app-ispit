<?php

namespace App\Http\Controllers;

use App\Http\Requests\RegisterRequest;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthorisationController extends Controller
{
    public function register(Request $request)
    {
        $data = $request->all();
        $validator = Validator::make($data,[
            'username' => 'required|string|unique:users|between:2,50',
            'email' => 'required|string|email|unique:users',
            'password' => 'required|string|min:8',
        ]);

        if($validator->fails()){
            return response()->json([
               'message' => 'Validation fail',
                'errors' => $validator->errors()
            ],400);
        }else{
            $user = User::create([
            'username' => $data['username'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'role_id' => 2
        ]);

            Auth::login($user);
            return response()->json([
            'status' => 'success',
            'user' => $user,
                'authorisation' => [
                    'type' => 'bearer'
                ]
        ]);
        }

    }

    public function login(Request $request)
    {
        $data = $request->all();
        $validator = Validator::make($data,[
            'email' => 'required|string|email',
            'password' => 'required|string|min:8',
        ]);
        $credentials = $request->only('email','password');
        $token = Auth::guard('api')->attempt($credentials);
        if(!$token){
            return response()->json([
                'status' => 'error',
                'message' => 'Unauthorized'
            ],401);
        }
        $user = Auth::guard('api')->user()->load('role');
        return response()->json([
            'status' => 'success',
            'user' => $user,
            'authorisation' => [
                'token' => $token,
                'type' => 'bearer',
            ]
        ]);
    }

    public function getUser($id)
    {
        $user = User::with(['role','song.latestPrice','song' => function ($query) {
            $query->where('deleted', 0)
            ->withCount('likedByUsers');
        }])->find($id);
        if(!$user)
        {
            return response()->json([
                'status' => 'error',
                'message' => 'User not found'
            ],404);
        }
        return response()->json(
            [
                'status' => 'success',
                'username' => $user->username,
                'email' => $user->email,
                'role' => $user->role->role_name,
                'songs' => $user->song,
            ]
        );
    }


}

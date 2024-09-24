<?php

namespace App\Http\Controllers;

use App\Models\Basket;
use App\Models\BasketItem;
use App\Models\Genre;
use App\Models\Price;
use App\Models\Song;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class SongsController extends Controller
{
    public function songs()
   {
        $songs = DB::table('songs')
            ->where('songs.deleted', '=', 0)
            ->join('users', 'songs.user_id', '=', 'users.id')
            ->leftJoin('genre_song', 'songs.id', '=', 'genre_song.song_id')
            ->leftJoin('genres', 'genre_song.genre_id', '=', 'genres.id')
            ->join(DB::raw('(SELECT song_id, price FROM prices WHERE created_at = (SELECT MAX(created_at) FROM prices p2 WHERE p2.song_id = prices.song_id)) latest_prices'),
                'songs.id', '=', 'latest_prices.song_id')
            ->select('songs.id','songs.name', 'songs.image', 'latest_prices.price', 'users.username',DB::raw('GROUP_CONCAT(genres.id) as genre_ids'))
            ->groupBy('songs.id', 'songs.name', 'songs.image', 'latest_prices.price', 'users.username')
            ->get();
        return response()->json([
            'songs' => $songs
        ]);
    }
    public function store(Request $request)
    {
        $data = $request->all();
        $validator = Validator::make($data, [
           'name' => 'required|string|max:100',
            'artist' => 'required|exists:users,id',
            'genres' => 'required|exists:genres,id',
            'price' => 'required|min:0',
            'image' => 'required|string'
        ]);
        if ($validator->fails())
        {
            return response()->json([
                'status' => 'Validation fail',
                'errors' => $validator->errors()
            ],403);
        }else{
            try{
                DB::beginTransaction();
                $song = Song::create([
                    'name' => $data['name'],
                    'user_id' => $data['artist'],
                    'image' => $data['image']
                ]);
                $song->genres()->sync($data['genres']);
                Price::create([
                    'price' => $data['price'],
                    'song_id' => $song->id
                ]);
                DB::commit();
                return response()->json([
                    'status' => 'success',
                    'data' => $song
                ]);
            }catch (Exception $e){
                return response()->json([
                    'status' => 'error',
                    'message' => $e->getMessage()
                ],500);
            }
        }
    }

    public function edit(Request $request)
    {
        $data = $request->all();
        $validator = Validator::make($data, [
            'id' => 'required|exists:songs,id',
            'name' => 'required|string|max:100',
            'genres' => 'required|exists:genres,id',
            'price' => 'required|min:0',
            'image' => 'required|string'
        ]);
        if ($validator->fails())
        {
            return response()->json([
                'status' => 'Validation fail',
                'errors' => $validator->errors()
            ],403);
        }else{
            try{
                DB::beginTransaction();
                $song = Song::find($data['id']);
                $song->name = $data['name'];
                $song->image = $data['image'];
                $song->save();
                $song->genres()->sync($data['genres']);
                $price = Price::create([
                    'price' => $data['price'],
                    'song_id' => $song->id
                ]);
                $price->save();
                DB::commit();
            }catch (\Exception $e){
                return response()->json([
                    'status' => 'error',
                    'message' => $e->getMessage()
                ],500);
            }
        }
    }

    public function delete($id){
        try{
            DB::beginTransaction();
            $song = Song::find($id);
            if($song){
                $song->deleted = true;
                $song->save();
            }else{
                return response()->json([
                    'status' => 'error',
                    'message' => 'Song not found'
                ],400);
            }
            DB::commit();
        }catch (\Exception $e){
            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage()
            ],500);
        }
    }

    public function buy(Request $request)
    {
        $request->validate([
            'total_price' => 'required|numeric',
            'user' => 'required|exists:users,id',
            'items' => 'required|array',
            'items.*.id' => 'required|exists:songs,id',
            'items.*.qty' => 'required|integer|min:1',
        ]);

        $basket = Basket::create([
            'total_price' => $request->total_price,
            'user_id' => $request->user
        ]);

        foreach ($request->items as $item){
            BasketItem::create([
                'song_id' => $item['id'],
                'qty' => $item['qty'],
                'basket_id' => $basket->id,
            ]);
        }
        return response()->json([
            'status' => 'success',
            'message' => 'Song added to basket'
        ],201);
    }

    public function like(Request $request)
    {
        $request->validate([
            'songId' => 'required|exists:songs,id',
            'userId' => 'required|exists:users,id'
        ]);

        $song = Song::find($request['songId']);
        if (!$song->likedByUsers()->where('user_id', $request['userId'])->exists()) {
            $song->likedByUsers()->attach($request['userId']);
            return response()->json([
                'status' => 'success',
                'message' => 'Song liked'
            ],200);
        }
    }
}

<?php

use App\Http\Controllers\AuthorisationController;
use App\Http\Controllers\Gen;
use App\Http\Controllers\SongsController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::apiResource('/genres', Gen::class);
Route::controller(AuthorisationController::class)->group(function () {
    Route::post('register', 'register');
    Route::post('login', 'login');
    Route::get('/user/{id}', 'getUser');

});
Route::get('/songs',[SongsController::class, 'songs']);
Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
Route::post('/songs',[SongsController::class, 'store']);
Route::post('/edit',[SongsController::class, 'edit']);
Route::post('/delete/{id}',[SongsController::class, 'delete']);
Route::post('/buy',[SongsController::class, 'buy']);
Route::post('/like',[SongsController::class, 'like']);



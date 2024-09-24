<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Song extends Model
{
    use HasFactory;
    protected $fillable = ['name','user_id','image'];
    public function genres()
    {
        return $this->belongsToMany(Genre::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function price()
    {
        return $this->hasMany(Price::class);
    }
    public function baskets()
    {
        return $this->belongsToMany(Basket::class);
    }
    public function latestPrice()
    {
        return $this->hasOne(Price::class)->latest();
    }

    public function likedByUsers()
    {
        return $this->belongsToMany(User::class, 'song_like', 'song_id', 'user_id')->withTimestamps();
    }
}

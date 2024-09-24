<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BasketItem extends Model
{
    use HasFactory;
    protected $table = 'basket_item';
    protected $fillable = ['basket_id', 'song_id', 'qty'];
    public function basket()
    {
        return $this->belongsTo(Basket::class);
    }

    public function song()
    {
        return $this->belongsTo(Song::class);
    }
}

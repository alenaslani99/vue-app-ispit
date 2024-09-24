<?php

namespace Database\Seeders;

use App\Models\Genre;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class GenreSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    private $genre = ['Pop','Electronic','Trance','DnB','Afro','House','Techno'];
    public function run(): void
    {
        foreach ($this->genre as $gen) {
            $genreobj = new Genre();
            $genreobj->genre_name = $gen;
            $genreobj->save();
        }
    }
}

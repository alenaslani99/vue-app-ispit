<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('genre_song', function (Blueprint $table) {
            $table->renameColumn('songs_id', 'song_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('genre_song', function (Blueprint $table) {
            $table->renameColumn('song_id', 'songs_id');
        });
    }
};

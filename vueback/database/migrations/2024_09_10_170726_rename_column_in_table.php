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
            $table->renameColumn('genres_id', 'genre_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('genre_song', function (Blueprint $table) {
            $table->renameColumn('genre_id', 'genres_id');
        });
    }
};

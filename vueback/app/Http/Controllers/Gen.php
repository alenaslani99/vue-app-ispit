<?php

namespace App\Http\Controllers;

use App\Models\Genre;
use Illuminate\Http\Request;

class Gen extends Controller
{
    public function index()
    {
        return Genre::all();
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParsedDish extends Model
{
    use HasFactory;

    
    protected $fillable = ['id','name', 'image', 'description','restaurant', 'restaurantImg','user', 'userImg', 'rating', 'nComments'];   

}

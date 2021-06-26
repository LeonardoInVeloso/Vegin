<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParsedDishInfo extends Model
{
    use HasFactory;

    
    protected $fillable = ['id','name', 'image', 'description','restaurant', 'user', 'userImg', 'rating', 'nComments', 'comments'];   

}

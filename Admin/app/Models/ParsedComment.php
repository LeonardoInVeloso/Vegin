<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParsedComment extends Model
{
    use HasFactory;

    protected $fillable = ['content', 'user_id', 'userName', 'userImg'];

  
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dish extends Model
{
    use HasFactory;

    protected $table = 'dishes';
    protected $fillable = ['name', 'image', 'description', 'rating', 'establishment_id', 'user_id'];


    public function establishment(){

        return $this->belongsTo(Establishment::class);
    }

    public function user(){

        return $this->belongsTo(User::class);
    }

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }


}

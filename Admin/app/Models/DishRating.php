<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DishRating extends Model
{
    use HasFactory;

    protected $fillable = [
        'value',
        'user_id',
        'dish_id'
    ];

    public function user(){

        return $this->belongsTo(User::class);
    }

    public function dish(){

        return $this->belongsTo(Dish::class);
    }
}

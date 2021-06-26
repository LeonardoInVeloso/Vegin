<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EstablishmentRating extends Model
{
    use HasFactory;

    protected $fillable = [
        'value',
        'user_id',
        'establishment_id'
    ];

    public function user(){

        return $this->belongsTo(User::class);
    }

    public function establishment(){

        return $this->belongsTo(Establishment::class);
    }
}

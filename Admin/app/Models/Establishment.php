<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Establishment extends Model
{
    use HasFactory;

    protected $table = 'establishments';
    protected $fillable = ['name', 'image', 'notes', 'status', 'type', 'rating'];
    
    public function locations()
    {
        return $this->hasMany(Location::class, 'establishment_id');
    }

    public function dishes()
    {
        return $this->hasMany(Dish::class);
    }
}

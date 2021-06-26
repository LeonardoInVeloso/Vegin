<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $table = 'products';
    protected $fillable = ['name', 'image', 'notes', 'status', 'animal_ing', 'company_id', 'barcode_format', 'barcode_id'];

    public function company(){

        return $this->belongsTo(Company::class);
    }    
}

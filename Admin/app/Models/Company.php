<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
    use HasFactory;

    protected $table = 'companies';
    protected $fillable = ['name', 'image', 'notes', 'status', 'animal_prod', 'animal_tests', 'animal_event','group_id'];

    public function companyGroup(){

        return $this->belongsTo(CompanyGroup::class, 'group_id');
    }
    public function products()
    {
        return $this->hasMany(Product::class);
    }
}

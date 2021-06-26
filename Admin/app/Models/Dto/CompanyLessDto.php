<?php

namespace App\Models\Dto;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CompanyLessDto extends Model
{
    use HasFactory;
    protected $fillable = ['id','name', 'image','companyGroup'];   

}

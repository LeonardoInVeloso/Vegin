<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CompanyGroup extends Model
{
    use HasFactory;

    protected $table = 'company_groups';
    protected $fillable = ['name', 'image', 'notes', 'status', 'animal_tests', 'animal_event'];

    public function companies()
    {
        return $this->hasMany(Company::class, 'group_id');
    }
}

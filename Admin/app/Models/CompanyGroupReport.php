<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CompanyGroupReport extends Model
{
    use HasFactory;

    protected $fillable = [
        'description',
        'status',
        'user_id',
        'company_group_id'
    ];

    public function user(){

        return $this->belongsTo(User::class);
    }

    public function companyGroup(){

        return $this->belongsTo(CompanyGroup::class);
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Spatial;

class Location extends Model
{
    use HasFactory;

    use Spatial;

    protected $spatial = ['coordinates'];

    protected $table = 'locations';

    //protected $fillable = ['coordinates'];

    public function establishment(){

        return $this->belongsTo(Establishment::class);
    }
}

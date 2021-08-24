<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CityTranslation extends Model
{
    use SoftDeletes;
    
    protected $fillable = [
        'city_id', 'locale', 'title', 'description'
    ];
}

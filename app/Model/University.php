<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class University extends Model
{
    protected $fillable = [
    	'slug',
    	'name',
    	'description',
    	'image',
    	'country_id',
    	'state_id',
    	'city_id',
    ];
}

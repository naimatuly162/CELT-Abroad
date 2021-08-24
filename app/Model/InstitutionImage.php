<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class InstitutionImage extends Model
{
    protected $fillable = [
    	'id',
    	'institution_id',
    	'image_name'
    ];
}

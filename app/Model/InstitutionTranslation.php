<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class InstitutionTranslation extends Model
{
    protected $fillable = [
    	'id',
    	'institution_id',
    	'locale',
    	'title',
    	'description'
    ];

}

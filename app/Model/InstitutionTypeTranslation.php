<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class InstitutionTypeTranslation extends Model
{
	use SoftDeletes;
	
    protected $fillable = [
    	'id',
    	'institution_type_id',
    	'locale',
    	'title',
    	'description'
    ];
}

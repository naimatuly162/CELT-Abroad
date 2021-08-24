<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class LabelTranslation extends Model
{
    use SoftDeletes;
	
    protected $fillable = [
    	'id',
    	'label_id',
    	'locale',
    	'title',
    ];
}

<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class StudyDuration extends AbstractTranslatableModel
{
    use SoftDeletes;
		
    protected $fillable = [
    	'id'
    ];
}

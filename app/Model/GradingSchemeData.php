<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class GradingSchemeData extends AbstractTranslatableModel
{
    use SoftDeletes;

    protected $fillable = [
    	'grading_scheme_id','max','position',
    ];
}

<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class GradingSchemeDataTranslation extends Model
{
    use SoftDeletes;

    protected $fillable = [
    	'grading_scheme_data_id','locale','title',
    ];
}

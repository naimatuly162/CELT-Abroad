<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class ExamTranslation extends Model
{
	use SoftDeletes;

    protected $fillable = [
    	'id','exam_id','locale','title',
    ];
}

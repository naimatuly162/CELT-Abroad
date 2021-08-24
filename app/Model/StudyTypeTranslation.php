<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class StudyTypeTranslation extends Model
{
	use SoftDeletes;

    protected $fillable = [
        'study_type_id', 'locale', 'title'
    ];
}

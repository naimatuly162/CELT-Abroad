<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class StudyAreaTranslation extends Model
{
	use SoftDeletes;

    protected $fillable = [
        'study_area_id', 'locale', 'title','description'
    ];
}

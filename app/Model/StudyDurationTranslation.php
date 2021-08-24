<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class StudyDurationTranslation extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'study_duration_id', 'locale', 'title'
    ];    
}

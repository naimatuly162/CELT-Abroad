<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class MatchRequirement extends Model
{
    protected $fillable = [
        'user_id',
        'country_id',
        'education_level_id',
        'study_type_id',
        'study_area_id',
        'study_destination',
        'session_id',
        'previous_study_level',
        'exam_id',
        'score'
    ];

    protected $casts = [
        'study_destination' => 'array',
        'study_area_id'     => 'array',
    ];
}

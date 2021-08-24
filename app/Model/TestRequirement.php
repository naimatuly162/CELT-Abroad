<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class TestRequirement extends Model
{
    protected $fillable = [
        'user_id','country_id', 'education_level_id', 'study_area_id', 'activity','start_business','teach_people'
    ];
}

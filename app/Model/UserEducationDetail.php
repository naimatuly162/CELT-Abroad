<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;

class UserEducationDetail extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'user_id', 'edu_country_id', 'edu_highest_level_id', 'edu_grade_average', 'edu_grade_scheme_id', 'study_program_level_id', 'study_area_id', 'study_start_date', 'study_start_year', 'study_start_season', 'dest_country_id', 'gpa_per',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'dest_country_id' => 'array',
        'study_area_id' => 'array',
    ];

    // public function setStudyStartDateAttribute($value)
    // {
    //     // $this->attributes['study_start_date'] = Carbon::parse($value);
    //     $this->attributes['study_start_date'] = date('YYYY-MM-DD', strtotime($value));
    // }

    public function getStudyStartDateAttribute($value)
    {
        return date('Y-m-d', strtotime($value));
    }

    public function gradeScheme()
    {
        return  $this->belongsTo('App\Model\GradingScheme', 'edu_grade_scheme_id');
    }

    public function educationcountries()
    {
        return  $this->belongsTo('App\Model\Country', 'edu_country_id');
    }

    public function educationhighestlevel()
    {
        return  $this->belongsTo('App\Model\EducationLevel', 'edu_highest_level_id');
    }
}

<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;

class UserSchoolsAttended extends Model
{
    use SoftDeletes; 
    
    protected $fillable = [
        'user_id', 'at_edu_level_id', 'at_edu_country_id', 'at_edu_institution_name', 'at_edu_primary_institution_language', 'at_edu_from_date', 'at_edu_to_date', 'at_edu_degree_award', 'at_edu_degree_award_date', 'at_edu_school_address'
    ];

    // public function setAtEduFromDateAttribute($value)
    // {
    //     $this->attributes['at_edu_from_date'] = new Carbon($value);
    // }

    // public function setAtEduToDateAttribute($value)
    // {
    //     $this->attributes['at_edu_to_date'] = date('Y-m-d', strtotime($value));
    // }

    // public function setAtEduDegreeAwardDateAttribute($value)
    // {
    //     $this->attributes['at_edu_degree_award_date'] = date('Y-m-d', strtotime($value));
    // }

    public function getAtEduFromDateAttribute($value)
    {
        return date('Y-m-d', strtotime($value));
    }

    public function getAtEduToDateAttribute($value)
    {
        return date('Y-m-d', strtotime($value));
    }

    public function getAtEduDegreeAwardDateAttribute($value)
    {
        return date('Y-m-d', strtotime($value));
    }
}

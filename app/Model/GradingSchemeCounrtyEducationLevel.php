<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class GradingSchemeCounrtyEducationLevel extends Model
{
    use SoftDeletes;

    protected $fillable = [
    	'id','grading_scheme_id','country_id','education_level_id'
    ];

    public function country()
    {
        return $this->hasOne('App\Model\Country', 'id', 'country_id');
    }

    public function education()
    {
        return $this->hasOne('App\Model\EducationLevel', 'id', 'education_level_id');
    }

}

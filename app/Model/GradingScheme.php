<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class GradingScheme extends Model
{
    use SoftDeletes;

    protected $fillable = [
    	'id','min','max','is_custom',
    ];

    public function grade_country_edu()
    {
        return $this->hasMany('App\Model\GradingSchemeCounrtyEducationLevel', 'grading_scheme_id', 'id');
    }

    public function gradeSchemaData()
    {
        return $this->hasMany('App\Model\GradingSchemeData', 'grading_scheme_id', 'id');
    }

}

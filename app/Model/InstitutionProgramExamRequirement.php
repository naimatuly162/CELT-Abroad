<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class InstitutionProgramExamRequirement extends Model
{
    protected $fillable = [
    	'id',
    	'institution_program_id',
    	'exam_id',
    	'score',
    	'reading_score',
    	'listening_score',
    	'speaking_score',
    	'writing_score',
    ];

    public function examData()
    {
        return $this->hasOne('App\Model\Exam', 'id','exam_id');
    }

    public function subsectionSection()
    {
        return $this->hasMany('App\Model\InstitutionProgramExamRequirementDetail', 'requirement_id','id');
    }
}

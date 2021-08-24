<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class InstitutionProgramStudyArea extends Model
{
    protected $fillable = [
    	'id',
    	'institution_program_id',
    	'study_area_id',
    ];
}

<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class InstitutionProgramNotifyTrack extends Model
{
    protected $fillable = [
    	'institution_program_id',
    	'student_id',
    ];
}

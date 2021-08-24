<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class InstitutionProgramBonus extends Model
{
    protected $fillable = [
    	'id',
    	'institution_program_id',
    	'bonus_id',
    ];
}

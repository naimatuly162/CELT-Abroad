<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class StudentFavoriteProgram extends Model
{
    protected $fillable = [
    	'student_id', 'program_id',
    ];
}

<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class StudentFavoriteUniversity extends Model
{
    protected $fillable = [
    	'student_id', 'institution_id',
    ];
}

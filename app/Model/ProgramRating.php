<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class ProgramRating extends Model
{
    protected $fillable = [
        'id',
        'rating',
        'review',
        'student_id',
        'institution_program_id',
        'is_active'
    ];

    public function students()
    {
        return $this->belongsTo('App\Model\User', 'student_id');
    }
    public function institute_review()
    {
        return $this->belongsTo(InstitutionProgram::class, 'institution_program_id');
    }
}

<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class InstitutionProgramExamRequirementDetail extends Model
{
    use SoftDeletes;

    protected $fillable=[
        'requirement_id',
        'subsection_id',
        'score'
    ];
}

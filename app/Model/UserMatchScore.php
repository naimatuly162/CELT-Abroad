<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserMatchScore extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'user_id', 'exam_id', 'overall_score'
    ];
}

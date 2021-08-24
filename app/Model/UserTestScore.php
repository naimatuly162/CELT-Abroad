<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;

class UserTestScore extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'user_id', 'exam_id', 'overal_score', 'reading_score', 'listening_score', 'speaking_score', 'writing_score', 'exam_date'
    ];

    // public function setExamDateAttribute($value)
    // {
    //     $this->attributes['exam_date'] = date('Y-m-d', strtotime($value));
    // }

    public function getExamDateAttribute($value)
    {
        return date('Y-m-d', strtotime($value));
    }

    public function exam()
    {
        return $this->belongsTo('App\Model\Exam','exam_id');
    }

    public function subsectionSection()
    {
        return $this->hasMany('App\Model\UserTestScoreDetail','score_id');
    }
}

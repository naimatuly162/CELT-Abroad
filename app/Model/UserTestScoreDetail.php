<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserTestScoreDetail extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'score_id', 'subsection_id', 'score'
    ];

    public function subsectiondetail()
    {
        return $this->belongsTo('App\Model\ExamSubSection','subsection_id');
    }
}

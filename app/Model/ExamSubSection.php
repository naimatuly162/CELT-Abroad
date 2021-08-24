<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ExamSubSection extends AbstractTranslatableModel
{
    use SoftDeletes;

    protected $fillable = [
        'id','exam_id'
    ];

    public function exam()
    {
        return $this->belongsTo('App\Model\Exam', 'parent_id');
    }
}

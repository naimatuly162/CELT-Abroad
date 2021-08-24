<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Exam extends AbstractTranslatableModel
{
    use SoftDeletes;

    protected $fillable = [
    	'id','parent_id','min','max', 'type'
    ];

    public function exam()
    {
        return $this->belongsTo('App\Model\Exam', 'parent_id');
    }
    public function exams()
    {
        return $this->hasMany(ExamTranslation::class, 'exam_id','id');
    }

    public function examSubSection()
    {
        return $this->hasMany('App\Model\ExamSubSection', 'exam_id');
    }
}

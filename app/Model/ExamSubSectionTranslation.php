<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ExamSubSectionTranslation extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'id','exam_sub_section_id','locale','title',
    ];
}

<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class TutionFee extends AbstractTranslatableModel
{
    use SoftDeletes;

    protected $fillable = ['id'];
}

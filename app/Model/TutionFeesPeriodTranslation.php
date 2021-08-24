<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class TutionFeesPeriodTranslation extends Model
{
    use SoftDeletes;

    protected $fillable = [
    	'id',
    	'tution_fees_period_id',
    	'locale',
    	'title',
    ]; 
}

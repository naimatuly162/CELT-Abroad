<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class TutionFeeTranslation extends Model
{
    use SoftDeletes;

    protected $fillable = [
    	'id',
    	'tution_fee_id',
    	'locale',
    	'title',
    ]; 
}

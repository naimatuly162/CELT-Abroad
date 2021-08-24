<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CountryVisaTranslation extends Model
{
    use SoftDeletes;
    protected $fillable = [
        'country_id', 'locale', 'description','visa_type','requirement','fees', 'work_permit'
    ];
}

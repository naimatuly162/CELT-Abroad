<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CountryLivingTranslation extends Model
{
    use SoftDeletes;
    protected $fillable = [
        'country_id', 'locale', 'description', 'accommodation', 'transport', 'food', 'miscellaneous', 'utility'
    ];
}

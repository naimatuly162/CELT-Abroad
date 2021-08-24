<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class RegionTranslation extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'region_id', 'locale', 'title'
    ];
}

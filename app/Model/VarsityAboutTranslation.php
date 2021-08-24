<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class VarsityAboutTranslation extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'institution_id', 'locale', 'description','video_url'
    ];
}

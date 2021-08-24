<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SessionTranslation extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'session_id', 'locale', 'session_name'
    ];
}

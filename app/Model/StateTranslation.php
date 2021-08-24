<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class StateTranslation extends Model
{
    use SoftDeletes;
    
    protected $fillable = [
        'state_id', 'locale', 'title', 'description'
    ];
}

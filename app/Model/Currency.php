<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Currency extends Model
{
    use SoftDeletes;
    
    protected $fillable = [
        'code', 'symbol','usd_rate','is_default'
    ];

    protected $hidden = [
        'deleted_at'
    ];
}

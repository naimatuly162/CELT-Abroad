<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Locale extends Model
{
	public $timestamps = false;

    protected $primaryKey = 'locale'; // or null

    public $incrementing = false;

    protected $keyType = 'string';

    protected $fillable = [
        'locale', 'title','is_default'
    ];
}

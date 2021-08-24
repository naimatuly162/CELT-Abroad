<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Language extends Model
{
    use SoftDeletes;
    
    protected $fillable = [
        'country_id', 'code', 'title', 'status'
    ];

    protected $hidden = [
        'deleted_at'
    ];

    public function country()
    {
    	return $this->belongsTo('App\Model\Country');
    }
}

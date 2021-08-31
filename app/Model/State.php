<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class State extends AbstractTranslatableModel
{
    use SoftDeletes;

    protected $fillable = [
    	'image', 'country_id',
    ];

    public function country()
    {
    	return $this->belongsTo('App\Model\Country', 'country_id', 'id');
    }

    public function city()
    {
        return $this->hasMany('App\Model\City', 'id', 'city_id');
    }
    public function getImageAttribute($value)
    {
        return asset('storage/state'.'/'.$value);
    }
    public function institute()
    {
        return $this->hasMany('App\Model\Institution', 'state_id', 'id');
    }
}

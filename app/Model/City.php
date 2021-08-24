<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class City extends AbstractTranslatableModel
{
	use SoftDeletes;

   	protected $fillable = [
		'image', 'country_id', 'state_id',
   	];

   	public function state()
    {
    	return $this->belongsTo('App\Model\State');
    }

    public function country()
    {
    	return $this->belongsTo('App\Model\Country');
	}

	public function getImageAttribute($value)
    {
        return asset('storage/city'.'/'.$value);
    }
    public function institute_programs(){
   	    return $this->hasMany(Institution::class);
    }
    public function institute(){
   	    return $this->hasMany(Institution::class);
    }
}

<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class FoundationRoute extends Model
{
    
   	protected $fillable = [
        'country_id', 'apply_to', 'foundation_degrees',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'foundation_degrees' => 'array',
    ];

    public function country()
    {
    	return $this->belongsTo('App\Model\Country');
	}
}

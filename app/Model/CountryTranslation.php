<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CountryTranslation extends Model
{
    use SoftDeletes;

   	protected $fillable = [
        'country_id', 'locale', 'title', 'description','study_process','study_process_2','study_process_3'
    ];

    protected $appends = [
        'slug',
    ];

    public function country()
    {
    	return $this->belongsTo('App\Model\Country');
	}

    public function getSlugAttribute()
    {
        return str_replace(' ','-',$this->title);
    }
}

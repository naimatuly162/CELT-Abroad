<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CountryWiseEducation extends Model
{
    use SoftDeletes;
    protected $fillable=[
        'residential_country_id',
        'destination_country_id',
        'residential_degree_id',
        'destination_degree_id',
    ];

    function residentialCountry(){
        return $this->belongsTo('App\Model\Country');
    }

    function destinationCountry(){
        return $this->belongsTo('App\Model\Country');
    }

    function residentialDegree(){
        return $this->belongsTo('App\Model\EducationLevel');
    }

    function destinationDegree(){
        return $this->belongsTo('App\Model\EducationLevel');
    }
}

<?php

namespace App\Model;

use Illuminate\Database\Eloquent\SoftDeletes;

class Country extends AbstractTranslatableModel
{
    use SoftDeletes;

    protected $fillable = [
        'id', 'region_id', 'image', 'code', 'currency_id', 'is_residential', 'degree_sequence',
    ];

    protected $casts = [
        'degree_sequence' => 'array',
    ];

    public function state()
    {
        return $this->hasMany('App\Model\State', 'country_id', 'id');
    }

    public function city()
    {
        return $this->hasMany('App\Model\City', 'country_id', 'id');
    }

    public function currency()
    {
        return $this->hasOne('App\Model\Currency', 'id', 'currency_id');
    }

    public function country_translate()
    {
        return $this->hasMany('App\Model\CountryTranslation', 'country_id', 'id');
    }

    public function country_visa_translate()
    {
        return $this->hasMany(CountryVisaTranslation::class, 'country_id', 'id');
    }

    public function getImageAttribute($value)
    {
        return asset('storage/country' . '/' . $value);
    }

    public function institute()
    {
        return $this->hasMany('App\Model\Institution', 'country_id', 'id');
    }

    public function foundationRoute()
    {
        return $this->hasOne('App\Model\FoundationRoute', 'country_id', 'id');
    }

    public function residentialFoundationRoute()
    {
        return $this->foundationRoute()->whereIn('apply_to', ['both', 'residential']);
    }


    public function destinationFoundationRoute()
    {
        return $this->foundationRoute()->whereIn('apply_to', ['both', 'destination']);
    }

}

<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Institution extends AbstractTranslatableModel
{
    protected $fillable = [
        'id',
        'slug',
        'type_id',
        'country_id',
        'state_id',
        'city_id',
        'cover_photo',
        'national_ranking',
        'global_ranking',
        'youtube_url',
        'unirep_id',
        'is_featured',
        'is_active',
        'logo'
    ];

    public $appends = [
        'happy_student_count'
    ];

    public function getHappyStudentCountAttribute()
    {
        return \DB::table('institution_programs as ip')->join('applications as ap', 'ip.id', 'ap.program_id')->where('ap.status', 2)->where('ip.institution_id', $this->id)->count();
    }

    public function state()
    {
        return $this->belongsTo('App\Model\State');
    }

    public function type()
    {
        return $this->belongsTo('App\Model\InstitutionType');
    }

    public function institute_type()
    {
        return $this->hasOne('App\Model\InstitutionType', 'id', 'type_id');
    }

    public function city()
    {
        return $this->belongsTo('App\Model\City');
    }

    public function country()
    {
        return $this->belongsTo('App\Model\Country', 'country_id', 'id');
    }

    public function images()
    {
        return $this->hasMany('App\Model\InstitutionImage', 'institution_id', 'id');
    }

    /**
     * @return HasMany
     */
    public function programs(): HasMany
    {
        if (auth()->check() && auth()->user()->is_unirep) {
            return $this->hasMany('App\Model\InstitutionProgram', 'institution_id', 'id');
        } else {
            return $this->hasMany('App\Model\InstitutionProgram', 'institution_id', 'id')->where('is_active', 1);
        }
    }

    /**
     * @return HasMany
     */
    public function scholarships(): HasMany
    {
        if (auth()->check() && auth()->user()->is_unirep) {
            return $this->hasMany(InstitutionProgram::class, 'institution_id', 'id')
                ->whereHas('bonuses', function ($q) {
                    return $q->where('bonus_id', 2);
                });
        } else {
            return $this->hasMany(InstitutionProgram::class, 'institution_id', 'id')
                ->whereHas('bonuses', function ($q) {
                    return $q->where('bonus_id', 2);
                })
                ->where('is_active', 1);
        }
    }

    public function program_count()
    {
        return $this->hasMany(InstitutionProgram::class, 'institution_id', 'id');
    }

    public function scopeActive($query)
    {
        if (auth()->check() && auth()->user()->is_unirep) {
            return $query;
        } else {
            return $query->where('is_active', 1);
        }
    }

    public function getYoutubeUrlAttribute($value)
    {
        return ($value != '')
            ? 'https://www.youtube.com/embed/' . $value
            : null;
    }

    public function faqs()
    {
        return $this->hasMany('App\Model\FAQ\Faq', 'institution_id', 'id');
    }

}

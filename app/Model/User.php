<?php

namespace App\Model;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * @property email
 */
class User extends Authenticatable implements MustVerifyEmail
{
    use HasApiTokens, Notifiable, SoftDeletes;

    protected $guard = 'web';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'image', 'first_name', 'last_name', 'phone', 'email', 'default_lang', 'address', 'country', 'state', 'city', 'zipcode', 'password', 'otp', 'status', 'profile_progress', 'social_id', 'social_type', 'is_guest','provider_id','provider'
    ];

    protected $appends = [
        'is_student', 'full_name',
    ];

    public function getIsStudentAttribute()
    {
        return true;
    }


    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function countries()
    {
        return  $this->belongsTo('App\Model\Country', 'country');
    }

    public function states()
    {
        return  $this->belongsTo('App\Model\State', 'state');
    }

    public function cities()
    {
        return  $this->belongsTo('App\Model\City', 'city');
    }

    public function testScore()
    {
        return  $this->hasOne('App\Model\UserTestScore', 'user_id', 'id');
    }

    public function testScores()
    {
        return  $this->hasMany('App\Model\UserTestScore', 'user_id', 'id');
    }

    public function studentEducation()
    {
        return  $this->hasOne('App\Model\UserEducationDetail', 'user_id', 'id');
    }

    public function studentSchoolAttended()
    {
        return  $this->hasMany('App\Model\UserSchoolsAttended');
    }

    public function sendEmailVerificationNotification()
    {
        // $this->notify(new SendOTPVerificationNotification);
    }

    public function getFullNameAttribute()
    {
        return ucfirst($this->first_name).' '.ucfirst($this->last_name);
    }

    public function getSlugAttribute()
    {
        return ucfirst($this->first_name).'-'.ucfirst($this->last_name);
    }

    public function getImageAttribute($value)
    {
        if($value) {
            return asset('storage/student/'.$value);
        } else {
            return asset('images/profile.png');
        }
    }

    /**
     * @return HasMany
     */
    public function userMatchScores(): HasMany
    {
        return $this->hasMany(UserMatchScore::class);
    }
}

<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use App\Notifications\UnirepResetPasswordNotification;
use Illuminate\Database\Eloquent\SoftDeletes;

class UniversityRepresentative extends Authenticatable
{
	use Notifiable,SoftDeletes;

    protected $guard = 'unirep';

    protected $fillable = [
    	'name','email','password', 'first_name' ,'last_name' ,'image' ,'phone' ,'title', 'address' ,'zipcode','country_id','state_id','city_id'
    ];

    protected $appends = [
        'is_unirep'
    ];

    public function getIsUnirepAttribute()
    {
        return true;
    }

    /**
     * Send the password reset notification.
     *
     * @param string $token
     * @return void
     */
    public function sendPasswordResetNotification($token)
    {
        $this->notify(new UnirepResetPasswordNotification($token));
    }
}

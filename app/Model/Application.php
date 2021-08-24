<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Application extends Model
{
    protected $fillable = [
    	'id',
    	'program_id',
    	'student_id',
        'status',
        'bonus_id',
        'amount',
        'amount_usd',
    ];

    public function student()
    {
    	return $this->belongsTo('App\Model\User','student_id');
    }

    public function program()
    {
    	return $this->belongsTo('App\Model\InstitutionProgram','program_id');
    }

    public function bonus()
    {
        return $this->belongsTo('App\Model\Bonus','bonus_id');
    }

    public function givenbonus()
    {
        return $this->hasMany('App\Model\ApplicationBonus','application_id','id');
    }
}

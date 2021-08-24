<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class InstitutionProgramDeadline extends Model
{
	public $timestamps = false;

	protected $table = 'institution_program_deadlines';

    protected $fillable = [
    	'id',
    	'institution_program_id',
    	'session_id',
		'start_month',
		'last_month',
	];

    public function session()
    {
        return $this->belongsTo('App\Model\Session');
    }

	// public function setStartDateAttribute($value)
    // {
    //     $this->attributes['start_date'] = date('m-d', strtotime($value));
	// }

	// public function setLastDateAttribute($value)
    // {
    //     $this->attributes['last_date'] = date('m-d', strtotime($value));
	// }

	// public function getStartDateAttribute($value)
    // {
    //     return date('d', strtotime($value));
	// }

	// public function getLastDateAttribute($value)
    // {
    //     return date('d', strtotime($value));
    // }
}

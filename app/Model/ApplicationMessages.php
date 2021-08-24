<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ApplicationMessages extends Model
{
    use SoftDeletes;
    protected $fillable=['user_id','application_id','message'];

    public function application()
    {
    	return $this->belongsTo('App\Model\Application','application_id');
    }
}

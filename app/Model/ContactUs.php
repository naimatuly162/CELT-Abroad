<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ContactUs extends Model
{
    use SoftDeletes;
    
   	protected $fillable = [
		'full_name', 'email', 'phone', 'institution', 'country', 'message'
   	];
}

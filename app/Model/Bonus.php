<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Bonus extends AbstractTranslatableModel
{
	use SoftDeletes;
	
   public $translatedAttributes = ['title'];

}

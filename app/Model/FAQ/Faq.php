<?php

namespace App\Model\FAQ;

use App\Model\AbstractTranslatableModel;
use Illuminate\Database\Eloquent\SoftDeletes;

class Faq extends AbstractTranslatableModel
{
    use SoftDeletes;
    
   	protected $fillable = [
   		'type',
   		'institution_id',
   		'program_id'
   	];

   	public function institution()
    {          
        return $this->hasOne('App\Model\Institution', 'id','institution_id');
    }

    public function program()
    {          
        return $this->hasOne('App\Model\InstitutionProgram', 'id','program_id');
    }
}

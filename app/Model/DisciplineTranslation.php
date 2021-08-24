<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class DisciplineTranslation extends Model
{
    use SoftDeletes;

   	protected $fillable = [
        'discipline_id', 'locale', 'title', 'description'
    ];

    protected $appends = [
        'slug',
    ];

    public function discipline()
    {
    	return $this->belongsTo('App\Model\Discipline');
	}

    public function getSlugAttribute()
    {
        return str_replace(' ','-',$this->title);
    }
}

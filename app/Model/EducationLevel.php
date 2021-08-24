<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\SoftDeletes;

class EducationLevel extends AbstractTranslatableModel
{
	use SoftDeletes;

    protected $fillable = [
    	'id',
    	'is_foundation',
    ];

    public function education_translate()
    {
        return $this->hasMany('App\Model\EducationLevelTranslation', 'education_level_id', 'id');
    }

    /**
     * @return HasOne
     */
    public function educationLevelTranslate(): HasOne
    {
        return $this->hasOne(EducationLevelTranslation::class, 'education_level_id', 'id');
    }

//    public function programs()
//    {
//        return $this->hasMany(InstitutionProgram::class, 'current_degree_level_id', 'id');
//    }
}

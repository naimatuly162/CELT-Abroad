<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class EducationLevelTranslation extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'education_level_id', 'locale', 'title', 'description'
    ];

//    public function educationLavel()
//    {
//        return $this->hasOne('App\Model\EducationLevel', 'id', 'education_level_id');
//    }

    /**
     * @return HasMany
     */
    public function programs(): HasMany
    {
        return $this->hasMany(InstitutionProgram::class, 'current_degree_level_id', 'education_level_id');
    }
}

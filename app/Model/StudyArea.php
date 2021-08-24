<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class StudyArea extends AbstractTranslatableModel
{
    use SoftDeletes;

    protected $fillable = [
        'id','image'
    ];

    /**
     * @return BelongsToMany
     */
    public function disciplines(): BelongsToMany
    {
        return $this->belongsToMany(InstitutionProgram::class, 'institution_program_study_areas', 'study_area_id', 'institution_program_id');
    }

    /**
     * @return HasMany
     */
    public function studyAreaTranslations(): HasMany
    {
        return $this->hasMany(StudyAreaTranslation::class);
    }


}

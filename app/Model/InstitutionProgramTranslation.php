<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class InstitutionProgramTranslation extends Model
{
    protected $fillable = [
        'id',
        'institution_program_id',
        'locale',
        'title',
        'description'
    ];

    /**
     * @return HasMany
     */
    public function programs(): HasMany
    {
        return $this->hasMany(InstitutionProgram::class, 'id', 'institution_program_id');
    }
}

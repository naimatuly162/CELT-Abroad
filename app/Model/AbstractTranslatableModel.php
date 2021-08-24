<?php

namespace App\Model;

use Astrotomic\Translatable\Contracts\Translatable as TranslatableContract;
use Astrotomic\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

/**
 * Class AbstractTranslatableModel
 * @package App\Models
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
abstract class AbstractTranslatableModel extends Model implements TranslatableContract
{
    use Translatable;

    /**
     * The attributes that should be translated while retrieving translations
     *
     * @var array
     */
    public $translatedAttributes = [
        'title', 'description','session_name','study_process','study_process_2','study_process_3'
    ];
}

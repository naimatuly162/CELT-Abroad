<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Discipline extends AbstractTranslatableModel
{
    protected $fillable = [
        'title', 'description','cover_photo','logo','thumbnails'
    ];
    public function discipline_translate()
    {
        return $this->hasMany('App\Model\DisciplineTranslation', 'discipline_id', 'id');
    }

    public function getCoverPhotoAttribute($value)
    {
        return asset('storage/discipline'.'/'.$value);
    }
    public function getlogoAttribute($value)
    {
        return asset('storage/discipline'.'/'.$value);
    }
    public function getthumbnailsAttribute($value)
    {
        return asset('storage/discipline'.'/'.$value);
    }
}

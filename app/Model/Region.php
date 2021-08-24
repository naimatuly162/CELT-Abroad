<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Region extends AbstractTranslatableModel
{
    use SoftDeletes;

    protected $fillable = [
        'id'
    ];

    public function countries(){
        return $this->hasMany(Country::class,'region_id', 'id');
    }
}

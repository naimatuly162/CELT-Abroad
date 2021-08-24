<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Session extends AbstractTranslatableModel
{
    use SoftDeletes;

    protected $fillable = [
        'id'
    ];

    public function sessions(){
        return $this->hasMany(SessionTranslation::class,'session_id','id');
    }
}

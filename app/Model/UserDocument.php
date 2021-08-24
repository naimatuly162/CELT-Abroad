<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserDocument extends Model
{
    use SoftDeletes;
    protected $fillable=['user_id','type','name'];

    public function getNameAttribute($value)
    {
        if($value) {
            return asset('storage/user_document/'.$value);
        } else {
            return asset('images/profile.png');
        }
    }
}

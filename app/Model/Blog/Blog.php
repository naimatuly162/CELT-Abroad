<?php

namespace App\Model\Blog;

use App\Model\AbstractTranslatableModel;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Str;

class Blog extends AbstractTranslatableModel
{
    use SoftDeletes;

    protected $fillable = [
        'id', 'image'
    ];

    public function getImageAttribute($value)
    {
        return asset('storage/blog' . '/' . $value);
    }

    public function getCreatedAtAttribute($value)
    {
        return date('M d, Y', strtotime($value));
    }
    public function blogs(){
        $locale =  Config::get('app.locale');
        return $this->hasMany('App\Model\blog\BlogTranslation', 'blog_id','id')->where('locale',$locale)->where([['slug','!=',null]]);
    }

}

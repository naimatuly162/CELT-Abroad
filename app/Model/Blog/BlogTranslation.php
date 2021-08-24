<?php

namespace App\Model\Blog;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class BlogTranslation extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'blog_id', 'category_id', 'locale', 'title', 'slug', 'description'
    ];

    public function category()
    {
        return $this->belongsTo('App\Model\Blog\BlogCategory');
    }

//    public function setSlugAttribute($value)
//    {
//        $slug = Str::slug($this->title);
//        $count = static::whereRaw("slug RLIKE '^{$slug}(-[0-9]+)?$'")->count();
//        $this->attributes['slug'] = $count ? "{$slug}-{$count}" : $slug;
//    }

    protected static function boot()
    {
        parent::boot();
        static::creating(function ($blog) {
            $slug = Str::slug($blog->title);
            $count = static::whereRaw("slug RLIKE '^{$slug}(-[0-9]+)?$'")->count();
            $blog->slug = $count ? "{$slug}-{$count}" : $slug;

        });
//        static::updating(function ($blog) {
//
//            $slug = Str::slug($blog->title);
//            $count = static::whereRaw("slug RLIKE '^{$slug}(-[0-9]+)?$'")->count();
//            $blog->slug = $count ? "{$slug}-{$count}" : $slug;
//
//        });


    }


}

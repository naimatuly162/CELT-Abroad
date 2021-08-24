<?php

namespace App\Model\Blog;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BlogCategoryTranslation extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'category_id', 'locale', 'title'
    ];
}

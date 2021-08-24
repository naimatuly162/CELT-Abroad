<?php

namespace App\Model\Blog;

use Illuminate\Database\Eloquent\SoftDeletes;
use App\Model\AbstractTranslatableModel;

class BlogCategory extends AbstractTranslatableModel
{
    use SoftDeletes;

    protected $fillable = [
        'id',
    ];
}

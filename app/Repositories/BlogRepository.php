<?php

namespace App\Repositories;

use App\Contracts\BlogContract;
use App\Model\Blog\Blog;
use App\Model\Blog\BlogTranslation;
use Illuminate\Support\Str;

class BlogRepository implements BlogContract
{
    /**
     * store new Blog in database
     *
     * @param array $data
     *
     * @return \App\Models\Blog
     */
    public function save(array $data)
    {
        $blog = new Blog;

        if (isset($data['image'])) {
            $blog_image = uploadFile($data['image'], 'blog');
            $blog->image = $blog_image;
        }

        foreach ($data['blog'] as $key => $value) {
            $datas[$key] = $value;
        }

        $blog->fill($datas)->save();
        return $blog;
    }

    /**
     * update Blog in database
     *
     * @param array $data
     * @param int $id
     *
     * @return \App\Models\Blog
     */
    public function update($data, int $id)
    {
        $blog = Blog::findOrFail($id);

        if (isset($data['image'])) {
            $blog_image = uploadFile($data['image'], 'blog');
            $blog->image = $blog_image;
        }

        foreach ($data['blog'] as $key => $value) {
            $datas[$key] = $value;
            if ($value['title'] != NULL) {
                $slug = Str::slug(($value['title'] ?? null));
                $count = BlogTranslation::where([['slug','!=',null],['blog_id','!=',$id]])->whereRaw("slug RLIKE '^{$slug}(-[0-9]+)?$'")->count();
                $datas[$key]['slug'] = $count ? "{$slug}-{$count}" : $slug;
            }

        }


        $blog->fill($datas)->save();
        return $blog;
    }

    /**
     * delete Blog from database
     *
     * @param int $id
     *
     * @return boolean
     */
    public function delete(int $id)
    {
        $blog = Blog::where('id', $id)->first();
        $blog->translations()->delete();
        $blog->delete();

        return response()->json(['success' => true]);
    }

}

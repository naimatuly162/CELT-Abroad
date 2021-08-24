<?php
namespace App\Repositories;

use App\Contracts\BlogCategoryContract;
use App\Model\Blog\BlogCategory;

class BlogCategoryRepository implements BlogCategoryContract
{
    public function save(array $data)
    {
        $category =  new BlogCategory;
        
        foreach ($data['category'] as $key => $value) {
            $datas[$key] = $value;
        }
        
        $category->fill($datas)->save();

        return $category;
    }   

}

?>
<?php
namespace App\Repositories;

use App\Contracts\ApplicationContract;
use App\Model\Blog\BlogCategory;

class ApplicationRepository implements ApplicationContract
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
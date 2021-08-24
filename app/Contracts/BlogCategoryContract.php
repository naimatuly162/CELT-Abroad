<?php
namespace App\Contracts;

/**
 * @method \App\Model\BlogCategory store(array $data) save new BlogCategory
 * @method \App\Model\BlogCategory update(array $data, int $id) update BlogCategory
 * @method \App\Model\BlogCategory delete(int $id) delete Blog
 */

interface BlogCategoryContract
{
    public function save(array $data);
}
?>
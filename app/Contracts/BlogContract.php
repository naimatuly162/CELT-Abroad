<?php
namespace App\Contracts;

/**
 * @method \App\Model\Blog store(array $data) save new Blog
 * @method \App\Model\Blog update(array $data, int $id) update Blog
 * @method \App\Model\Blog delete(int $id) delete Blog
 */

interface BlogContract
{
    public function save(array $data);
    public function update(array $data, int $id);
    public function delete(int $id);
}
?>
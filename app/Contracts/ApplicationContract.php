<?php
namespace App\Contracts;

/**
 * @method \App\Model\Application store(array $data) save new Application
 * @method \App\Model\Application update(array $data, int $id) update Application
 * @method \App\Model\Application delete(int $id) delete Blog
 */

interface ApplicationContract
{
    public function save(array $data);
}
?>
<?php
namespace App\Contracts;

/**
 * @method \App\Model\FAQ store(array $data) save new FAQ
 * @method \App\Model\FAQ update(array $data, int $id) update FAQ
 * @method \App\Model\FAQ delete(int $id) delete Blog
 */

interface FAQContract
{
    public function save(array $data);
    public function update(array $data, int $id);
    public function delete(int $id);
}
?>
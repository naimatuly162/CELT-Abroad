<?php
namespace App\Contracts;

/**
 * @method \App\Model\PrefilledDate store(array $data) save new PrefilledDate
 * @method \App\Model\PrefilledDate update(array $data, int $id) update PrefilledDate
 * @method \App\Model\PrefilledDate delete(int $id) delete PrefilledDate
 */

interface PrefilledDateContract
{
    public function save(array $data);
    public function update(array $data, int $id);
    public function delete(int $id);
}
?>
<?php
namespace App\Contracts;

/**
 * Interface InstitutionContract
 * @package App\Contracts
 */

interface InstitutionContract
{
    public function save(array $data);
    public function update(array $data, int $id);
    public function delete(int $id);
    public function changeFeature(int $id);
    public function changeActive(int $id);
    public function viewImage(int $id);
}
?>

<?php
namespace App\Contracts;

/**
 * @method \App\Model\InstitutionType store(array $data) save new InstitutionType
 * @method \App\Model\InstitutionType update(array $data, int $id) update InstitutionType
 * @method \App\Model\InstitutionType delete(int $id) delete InstitutionType
 */

interface InstitutionTypeContract
{
    public function save(array $data);
    public function update(array $data, int $id);
    public function delete(int $id);
}
?>
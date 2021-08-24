<?php
namespace App\Contracts;

/**
 * @method \App\Model\UniversityRepresentative store(array $data) save new UniversityRepresentative
 * @method \App\Model\UniversityRepresentative update(array $data, int $id) update UniversityRepresentative
 * @method \App\Model\UniversityRepresentative delete(int $id) delete UniversityRepresentative
 */

interface UniversityRepresentativeContract 
{
    public function save(array $data);
    public function update(array $data, int $id);
    public function delete(int $id);
}
?>
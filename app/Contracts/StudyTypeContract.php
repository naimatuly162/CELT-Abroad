<?php
namespace App\Contracts;

/**
 * @method \App\Model\StudyType store(array $data) save new StudyType
 * @method \App\Model\StudyType update(array $data, int $id) update StudyType
 * @method \App\Model\StudyType delete(int $id) delete StudyType
 */

interface StudyTypeContract
{
    public function save(array $data);
    public function update(array $data, int $id);
    public function delete(int $id);
}
?>
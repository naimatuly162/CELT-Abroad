<?php
namespace App\Contracts;

/**
 * @method \App\Model\StudyArea store(array $data) save new StudyArea
 * @method \App\Model\StudyArea update(array $data, int $id) update StudyArea
 * @method \App\Model\StudyArea delete(int $id) delete StudyArea
 */

interface StudyAreaContract
{
    public function save(array $data);
    public function update(array $data, int $id);
    public function delete(int $id);
}
?>
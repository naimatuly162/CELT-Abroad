<?php
namespace App\Contracts;

/**
 * @method \App\Model\Exam store(array $data) save new Exam
 * @method \App\Model\Exam update(array $data, int $id) update Exam
 * @method \App\Model\Exam delete(int $id) delete Exam
 */

interface CountryWiseEducationContract
{
    public function save(array $data);
    public function update(array $data, int $id);
    public function delete(int $id);
}
?>
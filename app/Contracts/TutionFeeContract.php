<?php
namespace App\Contracts;

/**
 * @method \App\Model\TutionFee store(array $data) save new TutionFee
 * @method \App\Model\TutionFee update(array $data, int $id) update TutionFee
 * @method \App\Model\TutionFee delete(int $id) delete TutionFee
 */

interface TutionFeeContract
{
    public function save(array $data);
    public function update(array $data, int $id);
    public function delete(int $id);
}
?>
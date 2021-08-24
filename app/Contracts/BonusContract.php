<?php
namespace App\Contracts;

/**
 * @method \App\Model\Bonus store(array $data) save new Bonus
 * @method \App\Model\Bonus update(array $data, int $id) update Bonus
 * @method \App\Model\Bonus delete(int $id) delete Bonus
 */

interface BonusContract
{
    public function save(array $data);
    public function update(array $data, int $id);
    public function delete(int $id);
}
?>
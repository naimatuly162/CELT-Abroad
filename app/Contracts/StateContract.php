<?php
namespace App\Contracts;

/**
 * @method \App\Model\State store(array $data) save new state
 * @method \App\Model\State update(array $data, int $id) update state
 * @method \App\Model\State delete(int $id) delete state
 */

interface StateContract
{
    public function save(array $data);
    public function update(array $data, int $id);
    public function delete(int $id);
}
?>
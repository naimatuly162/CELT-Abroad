<?php
namespace App\Contracts;

/**
 * @method \App\Model\City store(array $data) save new City
 * @method \App\Model\City update(array $data, int $id) update City
 * @method \App\Model\City delete(int $id) delete City
 */

interface CityContract
{
    public function save(array $data);
    public function update(array $data, int $id);
    public function delete(int $id);
}
?>
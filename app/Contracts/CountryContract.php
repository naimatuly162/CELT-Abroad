<?php
namespace App\Contracts;

/**
 * @method \App\Model\Country store(array $data) save new package
 * @method \App\Model\Country update(array $data, int $id) update package
 * @method \App\Model\Country delete(int $id) delete package
 */

interface CountryContract
{
    public function all();

    public function create(array $data);

    public function update(array $data, int $id);

    public function delete($id);

    public function show($id);
}
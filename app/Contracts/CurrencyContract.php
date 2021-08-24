<?php
namespace App\Contracts;

/**
 * @method \App\Model\Currency store(array $data) save new package
 * @method \App\Model\Currency update(array $data, int $id) update package
 * @method \App\Model\Currency delete(int $id) delete package
 */

interface CurrencyContract
{
    public function all();

    public function create(array $data);

    public function update(array $data, int $id);

    public function delete($id);

    public function show($id);
}
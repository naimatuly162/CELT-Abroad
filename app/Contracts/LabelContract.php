<?php
namespace App\Contracts;

/**
 * @method \App\Model\Label store(array $data) save new package
 * @method \App\Model\Label update(array $data, int $id) update package
 * @method \App\Model\Label delete(int $id) delete package
 */

interface LabelContract
{
    public function all();

    public function create(array $data);

    public function update(array $data, int $id);

    public function delete($id);

    public function show($id);
}
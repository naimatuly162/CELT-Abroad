<?php
namespace App\Contracts;

/**
 * @method \App\Model\Language store(array $data) save new package
 * @method \App\Model\Language update(array $data, int $id) update package
 * @method \App\Model\Language delete(int $id) delete package
 */

interface LanguageContract
{
    public function all();

    public function create(array $data);

    public function update(array $data, int $id);

    public function delete($id);

    public function show($id);
}
<?php
namespace App\Contracts;

/**
 * @method \App\Model\EducationLevel store(array $data) save new package
 * @method \App\Model\EducationLevel update(array $data, int $id) update package
 * @method \App\Model\EducationLevel delete(int $id) delete package
 */

interface EducationContract
{
    public function all();

    public function create(array $data);

    public function update(array $data, int $id);

    public function delete($id);

    public function show($id);
}
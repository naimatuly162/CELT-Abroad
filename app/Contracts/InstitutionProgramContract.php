<?php
namespace App\Contracts;

/**
 * @method \App\Model\Institution store(array $data) save new Institution
 * @method \App\Model\Institution update(array $data, int $id) update Institution
 * @method \App\Model\Institution delete(int $id) delete Institution
 */

interface InstitutionProgramContract 
{
    public function edit(int $id);
    public function update(array $data, int $id);
    public function view(int $id);
    public function delete(int $id);
    public function changeFeature(int $id);
    public function changeActive(int $id);
}
?>
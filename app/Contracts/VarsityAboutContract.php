<?php
namespace App\Contracts;

/**
 * @method \App\Model\ApplyProcessTranslation store(array $data) save new package
 * @method \App\Model\ApplyProcessTranslation update(array $data, int $id) update package
 * @method \App\Model\ApplyProcessTranslation delete(int $id) delete package
 */

interface VarsityAboutContract
{
    public function update(array $data, int $id);

  public function delete($id);

  public function show($id);
}

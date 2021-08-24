<?php
namespace App\Contracts;

/**
 * Interface SessionContract
 * @package App\Contracts
 * @method \App\Model\Session store(array $data) save new Session
 * @method \App\Model\Session update(array $data, int $id) update Session
 * @method \App\Model\Session delete(int $id) delete Session
 *
 */

interface SessionContract
{
    public function save(array $data);
    public function update(array $data, int $id);
    public function delete(int $id);
}
?>

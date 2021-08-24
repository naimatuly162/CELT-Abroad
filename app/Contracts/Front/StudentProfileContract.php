<?php
namespace App\Contracts\Front;

/**
 * @method \App\Model\User update(array $data, $user) update user
 * @method \App\Model\User show(array $data) show user
 * @method \App\Model\User getState(int $id) get state
 * @method \App\Model\User getCity(int $id) get city
 * @method \App\Model\User getGrade(int $id, int $id2) get grade
 */

interface StudentProfileContract
{
    public function update(array $data, $user);
    public function updatenew(array $data, $user);
    public function show(array $data);
    public function getGrade(int $id, int $id2);
    public function applyProgram(int $id);
}

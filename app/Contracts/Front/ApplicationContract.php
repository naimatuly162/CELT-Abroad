<?php
namespace App\Contracts\Front;

/**
 * @method \App\Model\Application
 */

interface ApplicationContract 
{
    public function index();
    public function changeStatus(array $data);
    public function giveBonus(array $data);
}
?>
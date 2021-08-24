<?php
namespace App\Contracts\Front;

/**
 * @method \App\Model\Program store(array $data) save new Program
 * @method \App\Model\Program update(array $data, int $id) update Program
 * @method \App\Model\Program delete(int $id) delete Program
 */

interface ScholarshipContract 
{
	public function index();
	public function view($scholarship);
	public function viewAll();
}
?>
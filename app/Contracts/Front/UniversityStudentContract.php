<?php
namespace App\Contracts\Front;

/**
 * @method \App\Model\Institution store(array $data) save new Institution
 * @method \App\Model\Institution update(array $data, int $id) update Institution
 * @method \App\Model\Institution delete(int $id) delete Institution
 */

interface UniversityStudentContract 
{
	public function index();
	public function view($slug);
}
?>
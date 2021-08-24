<?php
namespace App\Contracts\Front;

/**
 * @method \App\Model\Institution store(array $data) save new Institution
 * @method \App\Model\Institution update(array $data, int $id) update Institution
 * @method \App\Model\Institution delete(int $id) delete Institution
 */

interface UniversityContract
{
	public function index($request);
	public function view($university);
	public function viewAll();
	public function getUniversity(Object $state, int $city);
	public function getUniversityByCountry(Object $country, int $city);
}
?>

<?php
namespace App\Contracts\Front;

/**
 * @method \App\Model\Institution store(array $data) save new Institution
 * @method \App\Model\Institution update(array $data, int $id) update Institution
 * @method \App\Model\Institution delete(int $id) delete Institution
 */

interface InstitutionContract 
{
	public function index();
    public function create();
    public function store(array $data);
    public function edit($institution);
    public function update(array $data,$institution);
    public function view($institution);
    public function viewImage(int $id);
}
?>
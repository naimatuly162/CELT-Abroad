<?php
namespace App\Contracts\Front;

/**
 * @method \App\Model\Program store(array $data) save new Program
 * @method \App\Model\Program update(array $data, int $id) update Program
 * @method \App\Model\Program delete(int $id) delete Program
 */

interface ProgramContract
{
	public function index(int $id=null);
    public function create();
    public function store(array $data);
    public function view($institutionProgram);
    public function edit($institutionProgram);
    public function update(array $data,int $id);
    public function copy($institutionProgram);
    public function programRating(array $data);
    public function singleProgram($id);
}

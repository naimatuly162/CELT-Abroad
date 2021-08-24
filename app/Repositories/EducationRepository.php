<?php namespace App\Repositories;

use App\Contracts\EducationContract;
use Illuminate\Database\Eloquent\Model;
use App\Model\EducationLevel;
use App\Model\EducationLevelTranslation;

class EducationRepository implements EducationContract
{
    // model property on class instances
    protected $model;

    // Constructor to bind model to repo
    public function __construct(Model $model)
    {
        $this->model = $model;
    }

    // Get all instances of model
    public function all()
    {
        return $this->model->all();
    }

    // create a new record in the database
    public function create(array $data)
    {
        $is_foundation = null;
        if(isset($data['is_foundation'])) {
            $is_foundation = $data['is_foundation'];
            unset($data['is_foundation']);
        }
        foreach ($data as $key => $value) {
            if($value['title'] != NULL)
            {
                $d['title'] = $value['title'];
                $d['description'] = $value['description'] ?? NULL;
                $datas[$key] = $d;
            }
        }
        $edu =  new EducationLevel;
        $edu->is_foundation = 0;
        $edu->fill($datas)->save();
        return $edu;
    }

    // update record in the database
    public function update(array $data, $id)
    {
        $is_foundation = 0;
        if(isset($data['is_foundation'])) {
            $is_foundation = $data['is_foundation'];
            unset($data['is_foundation']);
        }
        foreach ($data as $key => $value) {
            if($value['title'] != NULL)
            {
                $d['title'] = $value['title'];
                $d['description'] = $value['description'] ?? NULL;
                $datas[$key] = $d;
            }
        }
        $edu =  EducationLevel::find($id);
        $edu->is_foundation = 0;
        $edu->fill($datas)->save();
        return $edu;
    }

    // remove record from the database
    public function delete($id)
    {
        $edu =  EducationLevel::find($id);
        $edu->translations()->delete();
        $edu->delete();

        return response()->json(['success' => true]);
    }

    // show the record with the given id
    public function show($id)
    {
        return $this->model->find($id);
    }

    public function find($id)
    {
        return $this->model->find($id);
    }


}

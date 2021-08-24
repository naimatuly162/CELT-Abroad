<?php namespace App\Repositories;

use App\Contracts\StudyDurationContract;
use App\Model\StudyDuration;
use Illuminate\Database\Eloquent\Model;
use App\Model\StudyDurationTranslation;

class StudyDurationRepository implements StudyDurationContract
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
        foreach ($data as $key => $value) {
            if($value['title'] != NULL)
            {
                $datas[$key] = $value;
            }
        }
        $study = new StudyDuration;
        $study->fill($datas)->save();
        return $study;
    }

    // update record in the database
    public function update(array $data, $id)
    {
        foreach ($data as $key => $value) {
            if($value['title'] != NULL)
            {
                $datas[$key] = $value;
            }
        }
        $study = StudyDuration::find($id);
        $study->fill($datas)->save();
        return $study;
    }

    // remove record from the database
    public function delete($id)
    {
        StudyDurationTranslation::where('study_duration_id', $id)->delete();
        
        return $this->model->destroy($id);
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
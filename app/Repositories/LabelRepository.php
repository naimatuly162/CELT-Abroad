<?php namespace App\Repositories;

use App\Contracts\LabelContract;
use App\Model\Label;
use Illuminate\Database\Eloquent\Model;
use App\Model\LabelTranslation;

class LabelRepository implements LabelContract
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
        foreach ($data['label'] as $key => $value) {
            if($value['title'] != NULL)
            {
                $datas[$key] = $value;
            }
        }
        $label = new Label;
        $label->color = $data['color'];
        $label->fill($datas)->save();
        return $label;
    }

    // update record in the database
    public function update(array $data, $id)
    {
        foreach ($data['label'] as $key => $value) {
            if($value['title'] != NULL)
            {
                $datas[$key] = $value;
            }
        }
        $label = Label::find($id);
        $label->fill($data)->save();
        return $label;
    }

    // remove record from the database
    public function delete($id)
    {
        LabelTranslation::where('label_id', $id)->delete();
        
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
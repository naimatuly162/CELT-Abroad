<?php namespace App\Repositories;

use App\Contracts\TutionFeesPeriodContract;
use App\Model\TutionFeesPeriod;
use Illuminate\Database\Eloquent\Model;
use App\Model\TutionFeesPeriodTranslation;

class TutionFeesPeriodRepository implements TutionFeesPeriodContract
{
    // model property on class instances
    protected $model;

    // Constructor to bind model to repo
    public function __construct(Model $model)
    {
        $this->model = $model;
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
        $feesPeriod =  new TutionFeesPeriod;
        $feesPeriod->fill($datas)->save();
        return $feesPeriod;
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
        $label = TutionFeesPeriod::find($id);
        $label->fill($datas)->save();
        return $label;
    }

    // remove record from the database
    public function delete($id)
    {
        TutionFeesPeriodTranslation::where('tution_fees_period_id', $id)->delete();
        
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
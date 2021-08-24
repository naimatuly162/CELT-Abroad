<?php namespace App\Repositories;

use App\Contracts\GradingSchemeContract;
use App\Model\GradingScheme;
use Illuminate\Database\Eloquent\Model;
use App\Model\GradingSchemeCounrtyEducationLevel;
use App\Model\GradingSchemeDataTranslation;
use App\Model\GradingSchemeData;
use Illuminate\Support\Facades\DB;

class GradingSchemeRepository implements GradingSchemeContract
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
        try {
            // $grading = [];
        
            // Add gradingScheme relate
            $grading = [
                'max' => (!isset($data['is_custom']) && $data['max']) ? $data['max'] : NULL,
                'min' => (!isset($data['is_custom']) && $data['min']) ? $data['min'] : NULL,
                'is_custom' => isset($data['is_custom']) ? $data['is_custom'] : 0,
            ];
            
            $grades = GradingScheme::create($grading);
            
            // Add gradingScheme relate with education
            if(!empty($data['relate']))
            {
                foreach ($data['relate'] as $key => $value) {
                    $relate['grading_scheme_id'] = $grades->id;
                    $relate['country_id'] = $value['country_id'];
                    $relate['education_level_id'] = $value['education_level_id'];
                    $relatedSchema = $relate;       
                    $grade_country_education = GradingSchemeCounrtyEducationLevel::create($relatedSchema);
                }    
            }
            // Add schema data

            if(isset($data['is_custom'])) {
                if($data['is_custom'] == 1)
                {
                    foreach($data['grade'] as $key => $gvalue) {
                        $gradingData = [];
                        $gradingData = new GradingSchemeData;
                        $gradingData->grading_scheme_id =  $grades->id;
                        $gradingData->max =   $gvalue['rate'] ? $gvalue['rate'] : NULL;
                        $gradingData->position =   $gvalue['position'] ? $gvalue['position'] : 0;
                        foreach ($gvalue['lg'] as $key => $value) {
                            if($value['title'] != NULL)
                            {
                                $datas[$key] = $value;
                            }
                        }
                        $gradingData->fill($datas);
                        $gradingData->save();
                    }     
                }
            }   
        } catch (\Exception $e) {

            throw $e;
        }
    }

    // update record in the database
    public function update(array $data, $id)
    {
        try {
            $grade = GradingScheme::find($id);
            $grade->max = (isset($data['is_custom'])) ? NULL : $data['max'];
            $grade->min = (isset($data['is_custom'])) ? NULL : $data['min'];
            $grade->is_custom = isset($data['is_custom']) ? $data['is_custom'] : 0; 
            $grade->save();

            if(!empty($data['relate']))
            {
                GradingSchemeCounrtyEducationLevel::where('grading_scheme_id',$grade->id)->delete();
                foreach ($data['relate'] as $key => $value) {
                    $relate['grading_scheme_id'] = $grade->id;
                    $relate['country_id'] = $value['country_id'];
                    $relate['education_level_id'] = $value['education_level_id'];
                    $relatedSchema = $relate;       
                    $grade_country_education = GradingSchemeCounrtyEducationLevel::create($relatedSchema);
                }    
            }
            
            if(isset($data['is_custom'])) {
                if($data['is_custom'] == 1)
                {
                    GradingSchemeData::where('grading_scheme_id',$grade->id)->delete();
                    foreach($data['grade'] as $key => $gvalue) {
                        $gradingData = [];
                        $gradingData = new GradingSchemeData;
                        $gradingData->grading_scheme_id =  $grade->id;
                        $gradingData->max =   $gvalue['rate'] ? $gvalue['rate'] : NULL;
                        $gradingData->position =   $gvalue['position'] ? $gvalue['position'] : 0;
                        foreach ($gvalue['lg'] as $key => $value) {
                            if($value['title'] != NULL)
                            {
                                $datas[$key] = $value;
                            }
                        }
                        $gradingData->fill($datas);
                        $gradingData->save();
                    }     
                }
            }   
        } catch (\Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    // remove record from the database
    public function delete($id)
    {
        GradingSchemeCounrtyEducationLevel::where('grading_scheme_id',$id)->delete();
        $grade = GradingSchemeData::where('grading_scheme_id',$id)->get();
        foreach ($grade as $key => $value) {
            GradingSchemeDataTranslation::where('grading_scheme_data_id',$value->id)->delete();
            $value->delete();
        }

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
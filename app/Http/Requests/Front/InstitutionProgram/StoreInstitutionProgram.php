<?php

namespace App\Http\Requests\Front\InstitutionProgram;

use Illuminate\Foundation\Http\FormRequest;
use App\Model\State;
use App\Model\City;

class StoreInstitutionProgram extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules = [];
        $state = State::where('country_id', $this->country_id)->get()->toArray();
        $city = City::where('country_id', $this->country_id)->get()->toArray();
        
        $rules['title'] = 'required';
        $rules['subject_ranking'] = 'nullable|numeric';
        $rules['institution_id'] = 'required';
        $rules['country_id'] = 'required';
        $rules['current_degree_id'] = 'required';
        $rules['description'] = 'required';
        $rules['degree_level_id'] = 'required';
        $rules['language_id'] = 'required' ;
        $rules['gpa'] = 'required';
        $rules['tuition_fees'] = 'numeric';
        $rules['scholarship'] = 'nullable|numeric';
        $rules['currency_id'] = 'required';
        if (count($state)) {
            $rules['state_id'] = 'required';
        }
        if (count($city)) {
            $rules['city_id'] = 'required';
        }
        
        return $rules;        
    }

    public function messages()
    {
        return [
        
        ];
    }
}

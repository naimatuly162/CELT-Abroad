<?php

namespace App\Http\Requests\Front\UnirepSetting;

use Illuminate\Foundation\Http\FormRequest;
use App\Model\State;

class SettingRequest extends FormRequest
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

        $rules['first_name'] = 'required';
        $rules['last_name'] = 'required';
        $rules['title'] = 'required';
        $rules['zipcode'] = 'required';
        $rules['country_id'] = 'required';
        $rules['city_id'] = 'required';
        $rules['email'] = 'required';
        $rules['address'] = 'required';
        $rules['phone'] = 'required';

        if (State::where('country_id', $this->country)->count()) {
            $rules['state_id'] = 'required';
        }
        
        return $rules;

    }
}

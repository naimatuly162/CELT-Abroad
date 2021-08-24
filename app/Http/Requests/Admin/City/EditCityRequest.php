<?php

namespace App\Http\Requests\Admin\City;

use Illuminate\Foundation\Http\FormRequest;
use App\Model\State;

class EditCityRequest extends FormRequest
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
        $locale = defaultLanguage();
        $rules = [];

        if(isset($this->image)) {
            $rules['image'] = 'required|image|mimes:jpeg,png,jpg,gif,svg';
        }

        $rules['country_id'] = 'required';
        $rules['city.'.$locale.'.title'] = 'required|unique:city_translations,title,'.$this->city_id.',city_id,deleted_at,NULL';
        $rules['city.'.$locale.'.description'] = 'required';

        $state = State::where('country_id', $this->country_id)->get();
        if(count($state)) {
            $rules['state_id'] = 'required';
        } 

        return $rules;
    }

    public function attributes()
    {
        $locale = defaultLanguage();

        return [
            'city.'.$locale.'.title' => 'title('.$locale.')',
            'city.'.$locale.'.description' => 'description('.$locale.')',
        ];
    }
}

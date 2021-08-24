<?php

namespace App\Http\Requests\Admin;

class EditCountryRequest extends AdminBaseRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules = [];
        
        $rules['currency_id'] = 'required';

        if(isset($this->image)) {
            $rules['image'] = 'required|image|mimes:jpeg,png,jpg,gif,svg';
        }

        return $rules;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function translatableRules()
    {
        return [
            'title' => 'required|max:60|unique:country_translations,title,'.$this->country_id.',country_id,deleted_at,NULL',
            'description' => 'required',
        ];
    }
}

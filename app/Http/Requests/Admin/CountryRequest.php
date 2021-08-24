<?php

namespace App\Http\Requests\Admin;

class CountryRequest extends AdminBaseRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
            'currency_id' => 'required',
            'region_id' => 'required',
        ];
    }

     /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function translatableRules()
    {
        return [
            'title' => 'required|max:60|unique:country_translations,title,NULL,id,deleted_at,NULL',
            'description' => 'required',
        ];
    }
}

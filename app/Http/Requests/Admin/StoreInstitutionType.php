<?php

namespace App\Http\Requests\Admin;

class StoreInstitutionType extends AdminBaseRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            
        ];
    }

     /**
     * Get the validation translatable rules that apply to the request.
     *
     * @return array
     */
    public function translatableRules()
    {
        return [
            'title' => 'required|max:60|unique:institution_type_translations,title,NULL,id,deleted_at,NULL',
            'description' => 'required',
        ];
    }
}

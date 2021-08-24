<?php

namespace App\Http\Requests\Admin;

class EditInstitutionType extends AdminBaseRequest
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
            'title' => 'required|unique:institution_type_translations,title,'.$this->institution_id.',institution_type_id,deleted_at,NULL',
            'description' => 'required',
        ];
    }
}

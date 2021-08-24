<?php

namespace App\Http\Requests\Admin;

class EditStudyTypeRequest extends AdminBaseRequest
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
            'title' => 'required|unique:study_type_translations,title,'.$this->study_type_id.',study_type_id,deleted_at,NULL',
        ];
    }
}

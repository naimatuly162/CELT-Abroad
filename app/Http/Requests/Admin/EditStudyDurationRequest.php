<?php

namespace App\Http\Requests\Admin;

class EditStudyDurationRequest extends AdminBaseRequest
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
            'title' => 'required|unique:study_duration_translations,title,'.$this->study_duration_id.',study_duration_id,deleted_at,NULL',
        ];
    }
}

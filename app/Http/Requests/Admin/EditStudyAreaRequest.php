<?php

namespace App\Http\Requests\Admin;


class EditStudyAreaRequest extends AdminBaseRequest
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
            'title' => 'required|unique:study_area_translations,title,'.$this->study_area_id.',study_area_id,deleted_at,NULL',
            'description' => 'required',
        ];
    }
}

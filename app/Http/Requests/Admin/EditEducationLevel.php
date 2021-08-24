<?php

namespace App\Http\Requests\Admin;

class EditEducationLevel extends AdminBaseRequest
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
            'title' => 'required|unique:education_level_translations,title,'.$this->education_id.',education_level_id,deleted_at,NULL',
            'description' => 'required',
        ];
    }
}

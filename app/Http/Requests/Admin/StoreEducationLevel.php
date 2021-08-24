<?php

namespace App\Http\Requests\Admin;

class StoreEducationLevel extends AdminBaseRequest
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
            'title' => 'required|max:60|unique:education_level_translations,title,NULL,id,deleted_at,NULL',
            'description' => 'required',
        ];
    }
}

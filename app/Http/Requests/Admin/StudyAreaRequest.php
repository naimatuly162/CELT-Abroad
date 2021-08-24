<?php

namespace App\Http\Requests\Admin;

class StudyAreaRequest extends AdminBaseRequest
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
            'title' => 'required|max:60|unique:study_area_translations,title,NULL,id,deleted_at,NULL',
            'description' => 'required',
        ];
    }
}

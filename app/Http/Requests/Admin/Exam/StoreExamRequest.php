<?php

namespace App\Http\Requests\Admin\Exam;

use Illuminate\Foundation\Http\FormRequest;

class StoreExamRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $locale = defaultLanguage();

        return [
            'min' => 'required|numeric',
            'max' => 'required|numeric',
            'exam.'.$locale.'.title' => 'required|unique:exam_translations,title,NULL,id,deleted_at,NULL',
        ];
    }

    public function messages()
    {
        $locale = defaultLanguage();

        return [
            'exam.'.$locale.'.title.required' => 'The title field is required.',
            'exam.'.$locale.'.title.unique' => 'The '.$locale.' title has been already taken.',
        ];
    }
}

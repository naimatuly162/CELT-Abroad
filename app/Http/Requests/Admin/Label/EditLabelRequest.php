<?php

namespace App\Http\Requests\Admin\Label;

use Illuminate\Foundation\Http\FormRequest;

class EditLabelRequest extends FormRequest
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
            'color' => 'required',
            'label.'.$locale.'.title' => 'required|unique:label_translations,title,'.$this->label_id.',label_id,deleted_at,NULL',
        ];
    }

    public function messages()
    {
        $locale = defaultLanguage();

        return [
            'label.'.$locale.'.title.required' => 'The title field is required.',
            'label.'.$locale.'.title.unique' => 'The '.$locale.' title has been already taken.'
        ];
    }
}

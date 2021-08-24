<?php

namespace App\Http\Requests\Admin\Label;

use Illuminate\Foundation\Http\FormRequest;

class LabelRequest extends FormRequest
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
     * Get the validation translatable rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $locale = defaultLanguage();

        return [
            'color' => 'required',
            'label.'.$locale.'.title' => 'required|max:60|unique:label_translations,title,NULL,id,deleted_at,NULL',
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

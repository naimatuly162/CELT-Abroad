<?php

namespace App\Http\Requests\Admin\InstitutionProgram;

use Illuminate\Foundation\Http\FormRequest;

class EditProgramRequest extends FormRequest
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
            'program.'.$locale.'.title' => 'required',
            'program.'.$locale.'.description' => 'required',
            'subject_ranking' => 'required|numeric',
            'institution_id' => 'required',
            'country_id' => 'required',
            'current_degree_id' => 'required',
            'degree_level_id' => 'required',
            'language_id' => 'required' ,
            'gpa' => 'required',
            'tuition_fees' => 'numeric',
            'scholarship' => 'numeric',
            'currency_id' => 'required',
            'qs_ranking' => 'required|numeric',
            'faculty' => 'required|numeric',
        ];
    }

    public function messages()
    {
        $locale = defaultLanguage();

        return [
            'program.'.$locale.'.title.required' => 'The title field is required.',
            'program.'.$locale.'.description.required' => 'The description field is required.',
        ];
    }
}

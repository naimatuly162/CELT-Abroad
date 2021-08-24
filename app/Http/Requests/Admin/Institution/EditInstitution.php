<?php

namespace App\Http\Requests\Admin\Institution;

use Illuminate\Foundation\Http\FormRequest;
use App\Model\State;

class EditInstitution extends FormRequest
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
        $rules = [];
        $state = State::where('country_id', $this->country)->get()->toArray();

        $rules['institution.'.$locale.'.title'] = 'required';
        $rules['institution.'.$locale.'.description'] = 'required';
        $rules['type_id'] = 'required';
        $rules['country_id'] = 'required';
        $rules['city_id'] = 'required';
        $rules['national_ranking'] = 'required';
        $rules['global_ranking'] = 'required';
        $rules['youtube_url'] = 'required|url';
        $rules['image_name'] = 'required';

        if ($state) {
            $rules['state_id'] = 'required';
        }
        return $rules;
    }

    public function messages()
    {
        $locale = defaultLanguage();
        return [
            'institution.'.$locale.'.title.required' => 'The title field is required.',
            'institution.'.$locale.'.description.required' => 'The description field is required.',
            'image_name.max' => 'Cover image should not be more than 4 files.',
            'image_name.dimensions' => 'The image name has invalid image dimensions.'
        ];
    }
}

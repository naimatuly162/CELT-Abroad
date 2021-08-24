<?php

namespace App\Http\Requests\Admin\Institution;

use Illuminate\Foundation\Http\FormRequest;

class StoreInstitution extends FormRequest
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
        return [
            'name' => 'required',
            'type_id' => 'required',
            'country_id' => 'required',
            'state_id' => 'required',
            'city_id' => 'required',
            'national_ranking' => 'required',
            'global_ranking' => 'required',
            'description' => 'required',
            'youtube_url' => 'required|url',
            'is_featured' => 'required',
            'image_name.*' => 'required',
            'image_name' => 'required|array|max:4|dimensions:min_width=880,min_height=250',
        ];
    }

    public function messages()
    {
        return [
            'image_name.max' => 'Cover image should not be more than 4 files.',
            'image_name.dimensions' => 'The image name has invalid image dimensions.'
        ];
    }
}

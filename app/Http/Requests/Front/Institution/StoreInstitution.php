<?php

namespace App\Http\Requests\Front\Institution;

use Illuminate\Foundation\Http\FormRequest;
use App\Model\State;
use App\Model\City;

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
        //dd($this->method());
        //dd($this->route('institution'));
        $rules = [];
        $state = State::where('country_id', $this->country_id)->get()->toArray();
        $city = City::where('country_id', $this->country_id)->get()->toArray();

        $rules['title'] = 'required';
        $rules['type_id'] = 'required';
        $rules['country_id'] = 'required';
     //   $rules['national_ranking'] = 'required';
     //   $rules['global_ranking'] = 'required';
        $rules['description'] = 'required';
        //$rules['youtube_url'] = 'url';
        //$rules['cover_photo'] = 'dimensions:min_width=880,min_height=250';
        $rules['image_name'] = 'required';
        $rules['mini_cover'] = (in_array($this->method(), ['PUT', 'PATCH']) ? '':'required');
        $rules['faculty'] = 'required|numeric';

        if (count($state)) {
            // $rules['state_id'] = 'required';
        }

        if (count($city)) {
            $rules['city_id'] = 'required';
        }
        return $rules;
    }

    public function messages()
    {
        return [
            'image_name.required' => 'Photos field is required',
            'image_name.dimensions' => 'The image name has invalid image dimensions.'
        ];
    }
}

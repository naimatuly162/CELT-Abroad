<?php

namespace App\Http\Requests\Front\ContactUs;

use Illuminate\Foundation\Http\FormRequest;

class ContactUsRequest extends FormRequest
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
            'full_name' => 'required|max:50',
            'email' => 'required|unique:contact_us',
            'phone' => 'required|unique:contact_us|max:10',
            'institution' => 'required',
            'country' => 'required',
            'message' => 'required',
        ];
    }
}

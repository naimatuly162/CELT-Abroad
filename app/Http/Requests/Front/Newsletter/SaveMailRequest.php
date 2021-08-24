<?php

namespace App\Http\Requests\Front\Newsletter;

use Illuminate\Foundation\Http\FormRequest;

class SaveMailRequest extends FormRequest
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
            'email' => 'required|email|unique:mails',
        ];
    }

    public function messages()
    {
        return [
        
        ];
    }
}

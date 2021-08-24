<?php

namespace App\Http\Requests\Admin\Locale;

use Illuminate\Foundation\Http\FormRequest;

class LocaleRequest extends FormRequest
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
            'locale' => 'required|string|max:2|unique:locales,locale,'
                . request()->route()->parameter('locale') . ',locale',
            'title' => 'required|string|max:255',
        ];
    }
}

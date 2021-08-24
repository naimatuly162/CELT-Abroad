<?php

namespace App\Http\Requests\Admin\FAQ;

use Illuminate\Foundation\Http\FormRequest;

class StoreFAQRequest extends FormRequest
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
            'type' => 'required',
            'faq.'.$locale.'.question' => 'required|unique:faq_translations,question,NULL,id,deleted_at,NULL',
            'faq.'.$locale.'.answer' => 'required',
        ];
    }

    public function attributes()
    {
        $locale = defaultLanguage();
        
        return [
            'faq.'.$locale.'.question' => 'question('.$locale.')',
            'faq.'.$locale.'.answer' => 'answer('.$locale.')',
        ];
    }
}

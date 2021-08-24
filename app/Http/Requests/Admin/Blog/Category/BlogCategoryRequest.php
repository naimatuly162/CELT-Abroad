<?php

namespace App\Http\Requests\Admin\Blog\Category;

use Illuminate\Foundation\Http\FormRequest;

class BlogCategoryRequest extends FormRequest
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
            'category.'.$locale.'.title' => 'required|unique:blog_category_translations,title,NULL,id,deleted_at,NULL',
        ];
    }

    public function attributes()
    {
        $locale = defaultLanguage();
        
        return [
            'category.'.$locale.'.title' => 'category title',
        ];
    }
}

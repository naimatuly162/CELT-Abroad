<?php

namespace App\Http\Requests\Admin\Blog;

use Illuminate\Foundation\Http\FormRequest;

class StoreBlogRequest extends FormRequest
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
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
            'blog.'.$locale.'.category_id' => 'required',
            'blog.'.$locale.'.title' => 'required|unique:blog_translations,title,NULL,id,deleted_at,NULL',
            'blog.'.$locale.'.description' => 'required',
        ];
    }


    public function attributes()
    {
        $locale = defaultLanguage();
        
        return [
            'blog.'.$locale.'.category_id' => 'category('.$locale.')',
            'blog.'.$locale.'.title' => 'title('.$locale.')',
            'blog.'.$locale.'.description' => 'description('.$locale.')',
        ];
    }
}

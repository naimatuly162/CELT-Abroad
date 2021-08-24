<?php

namespace App\Http\Requests\Admin\Blog;

use Illuminate\Foundation\Http\FormRequest;

class EditBlogRequest extends FormRequest
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

        if(isset($this->image)) {
            $rules['image'] = 'required|image|mimes:jpeg,png,jpg,gif,svg';
        }
        
        $rules['blog.'.$locale.'.category_id'] = 'required';
        $rules['blog.'.$locale.'.title'] = 'required|unique:blog_translations,title,'.$this->blog_id.',blog_id,deleted_at,NULL';
        $rules['blog.'.$locale.'.description'] = 'required';
        
        return $rules;
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

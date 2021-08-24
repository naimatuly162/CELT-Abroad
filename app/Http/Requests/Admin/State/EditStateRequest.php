<?php

namespace App\Http\Requests\Admin\State;

use Illuminate\Foundation\Http\FormRequest;
use App\Model\Locale;

class EditStateRequest extends FormRequest
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

        $rules['country_id'] = 'required';
        $rules['state.'.$locale.'.title'] = 'required|unique:state_translations,title,'.$this->state_id.',state_id,deleted_at,NULL';
        $rules['state.'.$locale.'.description'] = 'required';

        return $rules;
    }

    public function attributes()
    {
        $locale = defaultLanguage();

        return [
            'state.'.$locale.'.title' => 'title('.$locale.')',
            'state.'.$locale.'.description' => 'description('.$locale.')',
        ];
    }
}

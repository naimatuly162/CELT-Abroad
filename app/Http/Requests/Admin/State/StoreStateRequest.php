<?php

namespace App\Http\Requests\Admin\State;

use Illuminate\Foundation\Http\FormRequest;
use App\Model\Locale;

class StoreStateRequest extends FormRequest
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
            'country_id' => 'required',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
            'state.'.$locale.'.title' => 'required|unique:state_translations,title,NULL,id,deleted_at,NULL',
            'state.'.$locale.'.description' => 'required',
        ];
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

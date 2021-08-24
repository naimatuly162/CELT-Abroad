<?php

namespace App\Http\Requests\Admin\region;

use App\Http\Requests\Admin\AdminBaseRequest;
use Illuminate\Foundation\Http\FormRequest;

class RegionRequest extends AdminBaseRequest
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

        ];
    }
    public function translatableRules()
    {
        return [
            'title' => 'required|string|unique:region_translations,title,NULL,id,deleted_at,NULL'
        ];
    }
}

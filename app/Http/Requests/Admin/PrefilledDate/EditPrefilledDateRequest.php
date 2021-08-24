<?php

namespace App\Http\Requests\Admin\PrefilledDate;

use Illuminate\Foundation\Http\FormRequest;

class EditPrefilledDateRequest extends FormRequest
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
            'type' => 'required',
            'period' => 'required|unique:prefilled_dates,period,' . $this->prefilled_date_id
        ];
    }
}

<?php

namespace App\Http\Requests\Admin;

class EditTutionFeeRequest extends AdminBaseRequest
{
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

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function translatableRules()
    {
        return [
            'title' => 'required|unique:tution_fee_translations,title,'.$this->tution_fee_id.',tution_fee_id,deleted_at,NULL',
        ];
    }
}

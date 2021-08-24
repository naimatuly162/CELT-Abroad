<?php

namespace App\Http\Requests\Admin;

class EditBonusRequest extends AdminBaseRequest
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
            'title' => 'required|max:255|unique:bonus_translations,title,'.$this->bonus_id.',bonus_id,deleted_at,NULL',
        ];
    }
}

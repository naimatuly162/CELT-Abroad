<?php

namespace App\Http\Requests\Admin\TutionFeesPeriod;

use App\Http\Requests\Admin\AdminBaseRequest;

class TutionFeesPeriodRequest extends AdminBaseRequest
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
     * Get the validation translatable rules that apply to the request.
     *
     * @return array
     */
    public function translatableRules()
    {
        return [
            'title' => 'required|max:60|unique:tution_fees_period_translations,title,NULL,id,deleted_at,NULL',
        ];
    }
}

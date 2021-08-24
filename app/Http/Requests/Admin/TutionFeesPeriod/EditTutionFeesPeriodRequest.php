<?php

namespace App\Http\Requests\Admin\TutionFeesPeriod;

use App\Http\Requests\Admin\AdminBaseRequest;

class EditTutionFeesPeriodRequest extends AdminBaseRequest
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
            'title' => 'required|unique:tution_fees_period_translations,title,'.$this->tution_fees_period_id.',tution_fees_period_id,deleted_at,NULL',
        ];
    }
}

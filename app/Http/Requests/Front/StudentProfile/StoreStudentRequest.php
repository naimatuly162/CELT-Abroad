<?php

namespace App\Http\Requests\Front\StudentProfile;

use Illuminate\Foundation\Http\FormRequest;
use App\Model\State;
use App\Model\City;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Auth;

class StoreStudentRequest extends FormRequest
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
        $user = Auth::guard('web')->user();
        if ($this->page == 1) {
            $rules = [];
            $state = State::where('country_id', $this->country)->get()->toArray();
            $city = City::where('country_id', $this->country)->get()->toArray();

            $rules['first_name'] = 'required|max:50';
            $rules['last_name'] = 'required|max:50';
            $rules['email'] = [
                'required',
                'email',
                Rule::unique('users')->ignore($user->id),
            ];
            $rules['phone'] = [
                'required',
                Rule::unique('users')->ignore($user->id),
                'max:10',
            ];
            $rules['address'] = 'nullable|max:255';
            $rules['country'] = 'required';
            $rules['zipcode'] = 'required';

            if(!$this->img_data) {
                $rules['image'] = 'required|image|mimes:jpeg,png,jpg,gif,svg';
            } else if ($state) {
                $rules['state'] = 'required';
            }

            if (count($city)) {
                $rules['city'] = 'required';
            }
            return $rules;

        } else if ($this->page == 2) {

            return [
                'edu_country_id' => 'required',
                'edu_highest_level_id' => 'required',
                'edu_grade_average' => 'required',
                'edu_grade_scheme_id' => 'required',
                'at_edu_level_id.*' => 'required',
                'at_edu_country_id.*' => 'required',
                'at_edu_institution_name.*' => 'required',
                'at_edu_primary_institution_language.*' => 'required',
                'at_edu_from_date.*' => 'required',
                'at_edu_degree_award.*' => 'required',
                'at_edu_degree_award_date.*' => 'required',
                'at_edu_school_address.*' => 'required',
            ];
        } else if ($this->page == 3) {

            return [
                'exam'                      => 'required|array',
                // 'exam.*.exam_date'          =>  'required',
                // 'exam.*.reading_score'      =>  'required',
                // 'exam.*.listening_score'    =>  'required',
                // 'exam.*.speaking_score'     =>  'required',
                // 'exam.*.writing_score'      =>  'required',
                // 'exam.*.overal_score'       =>  'required',
            ];
        } else if ($this->page == 4) {

            return [
                'study_area_id' => 'required',
               // 'study_program_level_id' => 'required',
                'study_start_year' => 'required',
                'study_start_season' => 'required',
                'dest_country_id' => 'required',
            ];

        } else {
            return [

            ];
        }
    }

    public function attributes()
    {
        return [

            'full_name'                                 =>  'full name',
            'title_name'                                =>  'title name',
            'email'                                     =>  'email',
            'phone'                                     =>  'phone',
            'address'                                   =>  'address',
            'country'                                   =>  'country',
            'state'                                     =>  'state',
            'city'                                      =>  'city',
            'zipcode'                                   =>  'zipcode',
            'edu_country_id'                            =>  'edu_country_id',
            'edu_highest_level_id'                      =>  'education level',
            'edu_grade_average'                         =>  'education grade average',
            'edu_grade_scheme_id'                       =>  'education scheme',
            'at_edu_level_id.*'                         =>  'education level',
            'at_edu_country_id.*'                       =>  'education country',
            'at_edu_institution_name.*'                 =>  'education institution name',
            'at_edu_primary_institution_language.*'     =>  'education institution language',
            'at_edu_from_date.*'                        =>  'education from date',
            'at_edu_degree_award.*'                     =>  'education degree award',
            'at_edu_degree_award_date.*'                =>  'education degree award date',
            'at_edu_school_address.*'                   =>  'education school address',
            'exam_date.' . $this->exam_id                 =>  'exam date',
            'reading_score.' . $this->exam_id             =>  'reading score',
            'listening_score.' . $this->exam_id           =>  'listening score',
            'speaking_score.' . $this->exam_id            =>  'speaking score',
            'writing_score.' . $this->exam_id             =>  'writing score',
            'overal_score.' . $this->exam_id              =>  'overal score',
            'study_area_id'                             =>  'study area',
            'study_program_level'                       =>  'program level',

        ];
    }
}

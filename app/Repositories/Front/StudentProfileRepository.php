<?php

namespace App\Repositories\Front;

use App\Contracts\Front\StudentProfileContract;
use App\Model\Country;
use App\Model\State;
use App\Model\City;
use App\Model\EducationLevel;
use App\Model\StudyArea;
use App\Model\Exam;
use App\Model\GradingSchemeCounrtyEducationLevel;
use App\Model\GradingScheme;
use App\Model\UserEducationDetail;
use App\Model\UserSchoolsAttended;
use App\Model\UserTestScore;
use App\Model\UserTestScoreDetail;
use App\Model\InstitutionProgram;
use App\Model\Application;
use Illuminate\Support\Facades\DB;
use App\Mail\ApplyApplicationProgram;
use Illuminate\Support\Facades\Mail;
use App\Mail\UserVerification;
use Illuminate\Support\Facades\Hash;

class StudentProfileRepository implements StudentProfileContract
{
    /**
     * store new User in database
     *
     * @param array $data
     *
     * @return \App\Models\User
     */
    public function update($data, $user)
    {
        DB::beginTransaction();
        try {

            $progress = $user->profile_progress ?? 0;
            if ($data['page'] == 1) {

                $user->first_name   =   $data['first_name'];
                $user->last_name    =   $data['last_name'];
                $user->email        =   $data['email'];
                $user->phone        =   $data['phone'];
                $user->address      =   isset($data['address']) ? $data['address'] : '';
                $user->country      =   $data['country'];
                $user->state        =   $data['state'];
                $user->city         =   $data['city'];
                $user->zipcode      =   $data['zipcode'];

                if (isset($data['image'])) {
                    $student_image  =   uploadFile($data['image'], 'student');
                    $user->image    =   $student_image;
                }

                $user->save();
                // $data['msg'] = __('student_profile.success.personal_detail')." updated successfully";


            } else if ($data['page'] == 2) {
                $grading_scheme = GradingScheme::find($data['edu_grade_scheme_id']);
                $gpa_per = $data['edu_grade_average'];
                if($grading_scheme) {
                    $max = $grading_scheme->max;
                    $gpa_per = ( $data['edu_grade_average'] * 100 / $grading_scheme->max );
                }

                UserEducationDetail::updateOrCreate(
                    ['user_id' => $user->id],
                    [
                        'user_id'               =>  $user->id,
                        'edu_country_id'        =>  $data['edu_country_id'],
                        'edu_highest_level_id'  =>  $data['edu_highest_level_id'],
                        'edu_grade_average'     =>  $data['edu_grade_average'],
                        'edu_grade_scheme_id'   =>  $data['edu_grade_scheme_id'],
                        'gpa_per'               =>  $gpa_per,
                    ]
                );

                if(isset($data['at_edu_level_id'])) {
                    foreach ($data['at_edu_level_id'] as $key => $value) {
                        UserSchoolsAttended::updateOrCreate(
                            ['id' => isset($data['school_hidden_id']) ? $data['school_hidden_id'] : ''],
                            [
                                'user_id'                               =>  $user->id,
                                'at_edu_level_id'                       =>  $value,
                                'at_edu_country_id'                     =>  $data['at_edu_country_id'][$key],
                                'at_edu_institution_name'               =>  $data['at_edu_institution_name'][$key],
                                'at_edu_primary_institution_language'   =>  $data['at_edu_primary_institution_language'][$key],
                                'at_edu_from_date'                      =>  $data['at_edu_from_date'][$key],
                                'at_edu_to_date'                        =>  $data['at_edu_to_date'][$key],
                                'at_edu_degree_award'                   =>  $data['at_edu_degree_award'][$key],
                                'at_edu_degree_award_date'              =>  $data['at_edu_degree_award_date'][$key],
                                'at_edu_school_address'                 =>  $data['at_edu_school_address'][$key],
                            ]
                        );
                    }
                }

                // $data['msg'] = __('student_profile.success.education_attended')." updated successfully";

                $str = $data['remove_school_id'];
                if ($str) {
                    $arr = explode(',', $str);
                    if (count($arr)) {
                        UserSchoolsAttended::whereIn('id', $arr)->delete();
                    }
                }

                if ($progress==0 && $progress < 33) {
                    $user->profile_progress = 33;
                    $user->save();
                    $data['progress'] = $user->profile_progress;
                }
            } else if ($data['page'] == 3) {

                if(isset($data['exam'])) {
                    UserTestScore::where('user_id', $user->id)->delete();
                    //dd($data['exam'],$user->id);
                    foreach($data['exam'] as $key => $_value) {
                        if(isset($_value['exam_id'])) {
                            //dd($_value);
                            $userTestScore=UserTestScore::updateOrCreate(
                                [
                                    'user_id'           => $user->id,
                                    'exam_id'           => (int)$_value['exam_id'],
                                ],
                                [
                                    'exam_date'         =>  $_value['exam_date'],
                                    'reading_score'     =>  0,
                                    'listening_score'   =>  0,
                                    'speaking_score'    =>  0,
                                    'writing_score'     =>  0,
                                    'overal_score'      =>  $_value['overal_score'],
                                ]
                            );
                            foreach ($_value['score'] as $subsection_score){
                                UserTestScoreDetail::updateOrCreate([
                                    'score_id'=>$userTestScore->id,
                                    'subsection_id'=>$subsection_score['key'],
                                ],[
                                    'score_id'=>$userTestScore->id,
                                    'subsection_id'=>$subsection_score['key'],
                                    'score'=>$subsection_score['value'],
                                ]);
                            }
                            //dd($userTestScore->id);
                        }

                    }
                }



                if ($progress && $progress < 67) {
                    $user->profile_progress = 67;
                    $user->save();
                    $data['progress'] = $user->profile_progress;
                }

                // $data['msg'] = __('student_profile.success.exam_detail')." updated successfully";

            } else if ($data['page'] == 4) {

                UserEducationDetail::updateOrCreate(
                    ['user_id' => $user->id],
                    [
                        'user_id'               =>  $user->id,
                        'study_program_level_id' =>  null,
                        'study_start_year'      =>  $data['study_start_year'],
                        'study_start_season'    =>  $data['study_start_season'],
                        'study_area_id'         =>  $data['study_area_id'],
                        'dest_country_id'       =>  $data['dest_country_id'],
                    ]
                );

                // $data['msg'] = __('student_profile.success.education')." updated successfully";

                if ($progress && $progress < 99) {
                    $otp = rand(1000,9999);
                    $user->profile_progress = 100;
                    $user->otp = $otp;
                    $user->save();
                     Mail::to($user->email)->send(new UserVerification($user, $otp));
                    $data['progress'] = $user->profile_progress;
                }
                /*if ($progress < 100) {


                    $data['progress'] = $user->profile_progress;
                }*/
            } else if ($data['page'] == 5){
                if($data['otp'] == $user->otp)
                {
                    $user->email_verified_at = date("Y-m-d", time());
                    $user->password = Hash::make($data['password']);
                    $user->save();
                }
            }

            DB::commit();
        } catch (\Exception $e) {
            dd($e);
            DB::rollback();
        }

        if ((int) $data['page'] < 1) {
            $data['page'] = 0;
        }
        if ((int) $data['page'] == 4) {
            $data['page'] = 0;
        }
        ++$data['page'];

        return $data;
    }

    public function updatenew($data, $user)
    {
        DB::beginTransaction();
        try {

            $progress = $user->profile_progress ?? 0;
            if ($data['page'] == 1) {

                $user->first_name   =   $data['first_name'];
                $user->last_name    =   $data['last_name'];
                $user->email        =   $data['email'];
                $user->phone        =   $data['phone'];
                $user->address      =   isset($data['address']) ? $data['address'] : '';
                $user->country      =   $data['country'];
                $user->state        =   $data['state'];
                $user->city         =   $data['city'];
                $user->zipcode      =   $data['zipcode'];

                if (isset($data['image'])) {
                    $student_image  =   uploadFile($data['image'], 'student');
                    $user->image    =   $student_image;
                }

                $user->save();
                // $data['msg'] = __('student_profile.success.personal_detail')." updated successfully";

                if ($progress < 100) {

                    $otp = rand(1000,9999);
                    $user->profile_progress = 100;
                    $user->otp = $otp;
                    $user->save();
                    Mail::to($user->email)->send(new UserVerification($user, $otp));
                    $data['progress'] = $user->profile_progress;
                }
            } else if ($data['page'] == 2) {
                $grading_scheme = GradingScheme::find($data['edu_grade_scheme_id']);
                $gpa_per = $data['edu_grade_average'];
                if($grading_scheme) {
                    $max = $grading_scheme->max;
                    $gpa_per = ( $data['edu_grade_average'] * 100 / $grading_scheme->max );
                }

                UserEducationDetail::updateOrCreate(
                    ['user_id' => $user->id],
                    [
                        'user_id'               =>  $user->id,
                        'edu_country_id'        =>  $data['edu_country_id'],
                        'edu_highest_level_id'  =>  $data['edu_highest_level_id'],
                        'edu_grade_average'     =>  $data['edu_grade_average'],
                        'edu_grade_scheme_id'   =>  $data['edu_grade_scheme_id'],
                        'gpa_per'               =>  $gpa_per,
                    ]
                );

                if(isset($data['at_edu_level_id'])) {
                    foreach ($data['at_edu_level_id'] as $key => $value) {
                        UserSchoolsAttended::updateOrCreate(
                            ['id' => isset($data['school_hidden_id']) ? $data['school_hidden_id'] : ''],
                            [
                                'user_id'                               =>  $user->id,
                                'at_edu_level_id'                       =>  $value,
                                'at_edu_country_id'                     =>  $data['at_edu_country_id'][$key],
                                'at_edu_institution_name'               =>  $data['at_edu_institution_name'][$key],
                                'at_edu_primary_institution_language'   =>  $data['at_edu_primary_institution_language'][$key],
                                'at_edu_from_date'                      =>  $data['at_edu_from_date'][$key],
                                'at_edu_to_date'                        =>  $data['at_edu_to_date'][$key],
                                'at_edu_degree_award'                   =>  $data['at_edu_degree_award'][$key],
                                'at_edu_degree_award_date'              =>  $data['at_edu_degree_award_date'][$key],
                                'at_edu_school_address'                 =>  $data['at_edu_school_address'][$key],
                            ]
                        );
                    }
                }

                // $data['msg'] = __('student_profile.success.education_attended')." updated successfully";

                $str = $data['remove_school_id'];
                if ($str) {
                    $arr = explode(',', $str);
                    if (count($arr)) {
                        UserSchoolsAttended::whereIn('id', $arr)->delete();
                    }
                }

                if ($progress==0 && $progress < 25) {
                    $user->profile_progress = 25;
                    $user->save();
                    $data['progress'] = $user->profile_progress;
                }
            } else if ($data['page'] == 3) {

                if(isset($data['exam'])) {
                    UserTestScore::where('user_id', $user->id)->delete();
                    //dd($data['exam'],$user->id);
                    foreach($data['exam'] as $key => $_value) {
                        if(isset($_value['exam_id'])) {
                            //dd($_value);
                            $userTestScore=UserTestScore::updateOrCreate(
                                [
                                    'user_id'           => $user->id,
                                    'exam_id'           => (int)$_value['exam_id'],
                                ],
                                [
                                    'exam_date'         =>  $_value['exam_date'],
                                    'reading_score'     =>  0,
                                    'listening_score'   =>  0,
                                    'speaking_score'    =>  0,
                                    'writing_score'     =>  0,
                                    'overal_score'      =>  $_value['overal_score'],
                                ]
                            );
                            foreach ($_value['score'] as $subsection_score){
                                UserTestScoreDetail::updateOrCreate([
                                    'score_id'=>$userTestScore->id,
                                    'subsection_id'=>$subsection_score['key'],
                                ],[
                                    'score_id'=>$userTestScore->id,
                                    'subsection_id'=>$subsection_score['key'],
                                    'score'=>$subsection_score['value'],
                                ]);
                            }
                            //dd($userTestScore->id);
                        }

                    }
                }



                if ($progress && $progress < 50) {
                    $user->profile_progress = 50;
                    $user->save();
                    $data['progress'] = $user->profile_progress;
                }

                // $data['msg'] = __('student_profile.success.exam_detail')." updated successfully";

            } else if ($data['page'] == 4) {

                UserEducationDetail::updateOrCreate(
                    ['user_id' => $user->id],
                    [
                        'user_id'               =>  $user->id,
                        'study_program_level_id' =>  null,
                        'study_start_year'      =>  $data['study_start_year'],
                        'study_start_season'    =>  $data['study_start_season'],
                        'study_area_id'         =>  $data['study_area_id'],
                        'dest_country_id'       =>  $data['dest_country_id'],
                    ]
                );

                // $data['msg'] = __('student_profile.success.education')." updated successfully";

                if ($progress && $progress < 75) {

                    $user->profile_progress = 75;
                    $user->save();

                    $data['progress'] = $user->profile_progress;
                }
            } else if ($data['page'] == 5){
                if($data['otp'] == $user->otp)
                {
                    $user->email_verified_at = date("Y-m-d", time());
                    $user->password = Hash::make($data['password']);
                    $user->save();
                }
            }

            DB::commit();
        } catch (\Exception $e) {
            dd($e);
            DB::rollback();
        }

        if ((int) $data['page'] < 1) {
            $data['page'] = 0;
        }
        if ((int) $data['page'] == 4) {
            $data['page'] = 0;
        }
        ++$data['page'];

        return $data;
    }


    public function show($user)
    {
        $data['countries'] = Country::get();
        $data['edu_levels'] = EducationLevel::get();
        $data['study_areas'] = StudyArea::get();
        $data['exams'] = Exam::with('examSubSection')->get();
        $data['education_details'] = UserEducationDetail::where('user_id', $user->id)->first();
        $data['schools_attendeds'] = UserSchoolsAttended::where('user_id', $user->id)->get();
        $data['test_score'] = UserTestScore::where('user_id', $user->id)->get()->keyBy('exam_id')->toArray();
       if(count($data['test_score']) > 0){
           foreach ($data['test_score'] as $key=>$testscore){
               $subsectionscore=UserTestScoreDetail::where('score_id',$testscore['id'])->get()->keyBy('subsection_id')->toArray();
               $data['test_score'][$key]['subsection_score']=$subsectionscore;
           }
       }
        $country_id = old('country') ? old('country') : $user->country;
        $data['states'] = State::where('country_id', (int)$country_id)->get();
        $cities = City::where('country_id', (int)$country_id);
        if(count($data['states'])) {
            $state_id = old('state') ? old('state') : $user->state;
            $cities->where('state_id', (int)$state_id);
        }
        $data['cities'] = $cities->get();

        return $data;
        // return compact('countries', 'edu_levels', 'study_areas', 'exams', 'education_details', 'schools_attendeds', 'test_score', 'states', 'cities');
    }

    public function getGrade($countryId, $levelId)
    {
        $grade_scheme_id = GradingSchemeCounrtyEducationLevel::where('country_id', $countryId)
            ->where('education_level_id', $levelId)
            ->pluck('grading_scheme_id')->toArray();

        $grades = GradingScheme::whereIn('id', $grade_scheme_id)->get()->toArray();

        return $grades;
    }

    public function applyProgram($id)
    {
        $application = Application::where('program_id',$id)->where('student_id' ,auth()->user()->id)->first();
        $user_progress=auth()->user()->profile_progress;
        if((int)$user_progress < 90){
            return response()->json(['success' => false ,'message' => 'Please Complete Your Profile to apply.']);
        }
        if (!empty($application)) {
            return response()->json(['success' => true ,'message' => 'Already applied for this program.']);
        } else {
             $applications = Application::create(['program_id' => $id , 'student_id' => auth()->user()->id,'status' => 1]);

            $student = auth()->user();
            if($applications->program)
            {
                $unirep = $applications->program->unirep;
                \Log::info(' unirep ->email ',[$unirep->email]);
                 Mail::to($unirep->email)->send(new ApplyApplicationProgram($unirep,$applications->program,$student));
            }

            return response()->json(['success' => true , 'message' => 'You have applied the program successfully. We will get back to you as soon as possible...']);
        }
    }

    public function studentProgram()
    {
        $title = trans('header.my_program');
        $image = 'univ.jpg';
        $study =  isset(auth()->user()->studentEducation) ? auth()->user()->studentEducation->study_area_id : '';
        $programs = InstitutionProgram::active()->has('translation')->with('application')->get();
        $eligibleProgram = [];
        $rejectedProgram = [];
        $appliedProgram = [];
        $offeredProgram  = [];
        if (count($programs) > 0) {
            foreach ($programs as $key => $value) {
                if(count($value->studyAreas) > 0)
                {
                    $programStudy = $value->studyAreas->pluck('id')->toArray();
                    if(in_array($study,$programStudy)) {
                        $eligibleProgram[] = $value;
                    }
                }
            }

            foreach ($programs as $key => $value) {
                if(isset($value->application) && $value->application->status == 1) {
                    $appliedProgram[] = $value;
                }
            }

            foreach ($programs as $key => $value) {
                if(isset($value->application) && $value->application->status == 3) {
                    $rejectedProgram[] = $value;
                }
            }

            foreach ($programs as $key => $value) {
                if(isset($value->application) && $value->application->bonus_id != '') {
                    $offeredProgram[] = $value;
                }
            }
        }

        $eligiblePrograms = paginate($eligibleProgram,$perPage=6);
        $rejectedPrograms =  paginate($rejectedProgram,$perPage=6);
        $appliedPrograms  = paginate($appliedProgram,$perPage=6);
        $offeredPrograms  = paginate($offeredProgram,$perPage=6);

        $defaultCurrency = defaultCurrency();
        $program_likes = programLikes();

        return view('front.student.program', compact('title', 'image','rejectedPrograms' ,'defaultCurrency', 'program_likes' ,'appliedPrograms' ,'offeredPrograms' ,'eligiblePrograms'));
    }
}

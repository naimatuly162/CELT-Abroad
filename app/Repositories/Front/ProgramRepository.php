<?php
namespace App\Repositories\Front;

use App\Contracts\Front\ProgramContract;
use App\Mail\ProgramEligibleStudentMail;
use App\Model\Bonus;
use App\Model\City;
use App\Model\Country;
use App\Model\CountryWiseEducation;
use App\Model\Currency;
use App\Model\EducationLevel;
use App\Model\Exam;
use App\Model\FAQ\Faq;
use App\Model\Institution;
use App\Model\InstitutionProgram;
use App\Model\InstitutionProgramDeadline;
use App\Model\InstitutionProgramExamRequirement;
use App\Model\InstitutionProgramExamRequirementDetail;
use App\Model\InstitutionProgramNotifyTrack;
use App\Model\Language;
use App\Model\Locale;
use App\Model\ProgramRating;
use App\Model\Session;
use App\Model\State;
use App\Model\StudyArea;
use App\Model\StudyDuration;
use App\Model\StudyType;
use DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class ProgramRepository implements ProgramContract
{

    public function index($id = null)
    {
        $title = trans('header.programs');
        $image = 'student.jpg';
        $defaultCurrency = defaultCurrency();
        $program_likes = programLikes();

        if ($id != NULL) {
            $institutionPrograms = InstitutionProgram::where('institution_id', $id)->where('unirep_id', auth()->user()->id)->orderBy('institution_programs.id', 'desc');
        } else {

            if (auth()->check() && auth()->user()->is_unirep) {
                $institutionPrograms = InstitutionProgram::where('unirep_id', auth()->user()->id)->orderBy('institution_programs.id', 'desc');
            } else {
                if (auth()->user()) {
                    $user_edu_country_id = auth()->user()->studentEducation->edu_country_id;
                    $user_edu_edu_highest_level = auth()->user()->studentEducation->edu_highest_level_id;
                    $eligeble_program_country_wise = CountryWiseEducation::where('residential_country_id', $user_edu_country_id)->where('residential_degree_id', $user_edu_edu_highest_level)->get();
                    if (count($eligeble_program_country_wise) > 0) {
                        foreach ($eligeble_program_country_wise as $el) {
                            $destination_country_id[] = $el->destination_country_id;
                            $destination_degree_id[] = $el->destination_degree_id;
                        }
                    } else {
                        $destination_country_id = [];
                        $destination_degree_id = [];
                    }
                } else {
                    $destination_country_id = [];
                    $destination_degree_id = [];
                }
                // dd($eligeble_program_country_wise);
                $institutionPrograms = InstitutionProgram::active()->has('translation')->with(['happyStudent', 'exam'])->whereIn('country_id', $destination_country_id)->whereIn('current_degree_level_id', $destination_degree_id)->orderBy('institution_programs.id', 'desc');
            }
        }

        if (request()->search) {
            $institutionPrograms->whereHas('translation', function ($query) {
                $query->where('title', 'like', '%' . request()->search . '%');
            });
        }

        $institutionPrograms_old = $institutionPrograms->get();
        $eligibleProgram = array();
        $noteligibleProgram = array();
        $mixProgram = array();
        if (count($institutionPrograms_old) > 0) {
            foreach ($institutionPrograms_old as $program) {
                if ($program->isEligibility()) {
                    $eligibleProgram[] = $program;
                } else {
                    $noteligibleProgram[] = $program;
                }
            }
        }
        $mixProgram = array_merge($eligibleProgram, $noteligibleProgram);
        $institutionPrograms = paginate($mixProgram, 6);
        if (request()->search) {
            $institutionPrograms->appends(request()->except(['page', '_token']));
        }

        return compact('title', 'image', 'institutionPrograms', 'defaultCurrency', 'program_likes', 'id');
    }

    /**
     * create program in database
     */
    public function create($data = [])
    {
        $title = trans('header.programs');
        $image = 'student.jpg';
        $institutions = Institution::get();
        $countries = Country::where('is_residential', 0)->get();
        $educationLevels = EducationLevel::get();
        $studyTypes = StudyType::get();
        $sessions = Session::get();
        $studyAreas = StudyArea::get();
        $studyDurations = StudyDuration::get();
        $currencies = Currency::get();
        $bonuses = Bonus::get();
        $languages = Language::get();
        $exams = Exam::with('examSubSection')->get();
        $states = [];
        $cities = [];
        $default_institute = [];
        $months = listMonth();
        if ($data['country_id']) {
            $states = State::where('country_id', $data['country_id'])->get();
            $cities = City::where('country_id', $data['country_id']);
            if ($data['state_id']) {
                $cities->where('state_id', $data['state_id']);
            }
            $cities = $cities->get();
        } else if ($data['institutionId']) {
            $default_institute = Institution::find($data['institutionId']);
            $states = State::where('country_id', $default_institute->country_id)->get();
            $cities = City::where('country_id', $default_institute->country_id);
            if ($default_institute->state_id) {
                $cities->where('state_id', $default_institute->state_id);
            }
            $cities = $cities->get();
        }

        return compact('title', 'image', 'institutions', 'countries', 'educationLevels', 'sessions', 'studyTypes', 'studyAreas', 'studyDurations', 'currencies', 'bonuses', 'languages', 'exams', 'states', 'cities', 'default_institute', 'months');
    }

    /**
     * store new program in database
     *
     * @param array $data
     *
     * @return \App\Models\Program
     */
    public function store(array $data)
    {
        try {
            DB::beginTransaction();
            $slug = $this->programSlug(Str::slug($data['title']));
            if ($data['scholarship_type'] == 1) {
                $scholarship = $data['scholarship'];
            } else {
                $scholarship = ($data['tuition_fees'] * $data['scholarship']) / 100;
            }
            $program = new InstitutionProgram;
            $program->slug = $slug;
            $program->institution_id = $data['institution_id'];
            $program->country_id = $data['country_id'];
            $program->state_id = $data['state_id'];
            $program->city_id = $data['city_id'];
            $program->subject_ranking = $data['subject_ranking'];
            $program->gpa = $data['gpa'] ?? NULL;
            $program->current_degree_level_id = $data['current_degree_id'] ?? NULL;
            $program->degree_level_id = $data['degree_level_id'] ?? NULL;
            $program->study_type_id = $data['study_type_id'] ?? NULL;
            $program->study_duration_id = $data['study_duration_id'] ?? NULL;
            $program->language_id = $data['language_id'] ?? NULL;
            $program->currency_id = $data['currency_id'] ?? NULL;
            $program->application_fee = $data['application_fee'] ?? NULL;
            $program->unirep_id = auth()->user()->id;
            $program->tuition_fees = $data['tuition_fees'] != NULL ? $data['tuition_fees'] : '0';
            $program->fees_type = $data['fees_type'];
            $program->scholarship = $scholarship ?? 0;
            $program->scholarship_type = (int)$data['scholarship_type'] != NULL ? (int)$data['scholarship_type'] : 1;
            $program->scholarship_value = $data['scholarship'] != NULL ? $data['scholarship'] : '0';

            if (isset($data['currency_id'])) {

                $program->tuition_fees_usd = $data['tuition_fees'] != NULL ? usdCovert($data['currency_id'], $data['tuition_fees']) : '0';
                $program->scholarship_usd = $scholarship != NULL ? usdCovert($data['currency_id'], $scholarship) : '0';
            } else {
                $defaultCurrency = defaultCurrency();

                $program->tuition_fees_usd = $data['tuition_fees'] != NULL ? usdCovert($defaultCurrency->id, $data['tuition_fees']) : '0';
                $program->scholarship_usd = $scholarship != NULL ? usdCovert($defaultCurrency->id, $scholarship) : '0';
            }
            // if(isset($data['cover'])){
            //     $file = $data['cover'];
            //     $name = time().'.'.$file->getClientOriginalExtension();
            //     $file->move(Storage::disk('public')->path('program/cover'), $name);
            //     $program->cover = $name;
            // }
            if ($data['title'] != '') {
                $datas = [];
                $datas['en']['title'] = $data['title'];
                $datas['en']['description'] = $data['description'];
            }
            $program->fill($datas)->save();
            $program->save();

            if (isset($data['bonus_id'])) {
                $program->bonuses()->sync($data['bonus_id']);
            }
            if (isset($data['bonus_id'])) {
                $program->studyAreas()->sync($data['study_area_id']);
            }

            if (count($data['deadline']) > 0) {
                // $deadline = [];
                foreach ($data['deadline'] as $key => $value) {
                    $d['institution_program_id'] = $program->id;
                    $d['session_id'] = $value['session_id'];
                    $d['start_month'] = $value['start_month'];
                    $d['last_month'] = $value['last_month'];
                    $deadline = $d;
                    InstitutionProgramDeadline::create($deadline);
                }
            }
            if (isset($data['exam'])) {
                foreach ($data['exam'] as $key => $value) {
                    if (isset($value['exam_id'])) {
                        $e['institution_program_id'] = $program->id;
                        $e['exam_id'] = $value['exam_id'];
                        $e['score'] = $value['total'];
                        $e['reading_score'] = 0;
                        $e['listening_score'] = 0;
                        $e['speaking_score'] = 0;
                        $e['writing_score'] = 0;
                        $exam = $e;
                        if ($value['total'] != NULL) {
                            $programRequirment = InstitutionProgramExamRequirement::create($exam);

                            foreach ($value['score'] as $subsection_score) {
                                InstitutionProgramExamRequirementDetail::updateOrCreate([
                                    'requirement_id' => $programRequirment->id,
                                    'subsection_id' => $subsection_score['key'],
                                ], [
                                    'requirement_id' => $programRequirment->id,
                                    'subsection_id' => $subsection_score['key'],
                                    'score' => $subsection_score['value'],
                                ]);
                            }
                        }
                    }
                }
            }

            $students = $program->eligibleStudents()->get(['id', 'first_name', 'email']);
            if ($students) {
                foreach ($students as $student) {
                    Mail::to($student->email)->send(new ProgramEligibleStudentMail($program, $student));
                    InstitutionProgramNotifyTrack::create([
                        'institution_program_id' => $program->id,
                        'student_id' => $student->id,
                    ]);
                }
            }

            // Mail::to($program->eligibleStudents()->get(['id', 'first_name', 'email']))->send(new ProgramEligibleStudentMail($program));

            DB::commit();

            return true;
        } catch (\Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    public function usdCovert($defaultCurrency, $value)
    {
        $currencies = Currency::where('id', $defaultCurrency)->first();

        return $currencies->usd_rate * $value;
    }

    public function programSlug($slug, $i = 0)
    {
        $count = InstitutionProgram::where('slug', $slug)->count();

        if ($count == 0)
            return $slug;

        return $this->programSlug($slug . rand(1, 99));
    }

    public function view($institutionProgram)
    {
        $institutionProgram = InstitutionProgram::where('slug', $institutionProgram)->first();
        if (!empty($institutionProgram)) {
            $programReview = ProgramRating::where('institution_program_id', $institutionProgram->id)->paginate(3);
            $title = $institutionProgram->title;
            $image = 'student.jpg';
            $program_faqs = Faq::where('type', '1')->get();

            $defaultCurrency = defaultCurrency();

            return compact('institutionProgram', 'title', 'image', 'defaultCurrency', 'programReview', 'program_faqs');
        } else {
            abort(404);
        }

    }

    /**
     * @param $institutionProgram
     * @return array
     */
    public function edit($institutionProgram): array
    {
        $institutionProgram = InstitutionProgram::where('slug', $institutionProgram)->first();
        if (!empty($institutionProgram)) {
            $title = trans('program.edit_programs');
            $image = 'student.jpg';
            $institutions = Institution::get();
            $countries = Country::where('is_residential', 0)->get();
            $educationLevels = EducationLevel::get();
            $studyTypes = StudyType::get();
            $sessions = Session::get();
            $studyAreas = StudyArea::get();
            $studyDurations = StudyDuration::get();
            $currencies = Currency::get();
            $bonuses = Bonus::get();
            $languages = Language::get();
            $exams = Exam::with('examSubSection')->get();

            $months = listMonth();
            $dates = [];

            $country_id = old('country_id') ? old('country_id') : $institutionProgram->country_id;
            $states = State::where('country_id', (int)$country_id)->get();
            $cities = City::where('country_id', (int)$country_id);
            if (count($states)) {
                $state_id = old('state_id') ? old('state_id') : $institutionProgram->state_id;
                $cities->where('state_id', (int)$state_id);
            }
            $cities = $cities->get();

            $selectedBonus = [];
            if (!empty($institutionProgram->bonuses)) {
                foreach ($institutionProgram->bonuses as $key => $value) {
                    $selectedBonus[] = $value->id;
                }
            }
            $selectedAreas = [];
            if (!empty($institutionProgram->studyAreas)) {
                foreach ($institutionProgram->studyAreas as $key => $value) {
                    $selectedAreas[] = $value->id;
                }
            }
            return compact('title', 'image', 'institutions', 'countries', 'educationLevels', 'sessions', 'studyTypes', 'studyAreas', 'studyDurations', 'currencies', 'bonuses', 'languages', 'exams', 'institutionProgram', 'selectedAreas', 'selectedBonus', 'states', 'cities', 'months', 'dates');
        } else {
            abort(404);
        }
    }

    public function copy($institutionProgram)
    {
        $institutionProgram = InstitutionProgram::where('slug', $institutionProgram)->first();

        if (!empty($institutionProgram)) {
            $title = trans('program.copy_programs');
            $image = 'student.jpg';
            $institutions = Institution::get();
            $countries = Country::where('is_residential', 0)->get();
            $educationLevels = EducationLevel::get();
            $studyTypes = StudyType::get();
            $studyAreas = StudyArea::get();
            $studyDurations = StudyDuration::get();
            $currencies = Currency::get();
            $bonuses = Bonus::get();
            $languages = Language::get();
            $exams = Exam::with('examSubSection')->get();
            $months = listMonth();
            $dates = [];

            $country_id = old('country_id') ? old('country_id') : $institutionProgram->country_id;
            $states = State::where('country_id', (int)$country_id)->get();
            $cities = City::where('country_id', (int)$country_id);
            if (count($states)) {
                $state_id = old('state_id') ? old('state_id') : $institutionProgram->state_id;
                $cities->where('state_id', (int)$state_id);
            }
            $cities = $cities->get();

            $selectedBonus = [];
            if (!empty($institutionProgram->bonuses)) {
                foreach ($institutionProgram->bonuses as $key => $value) {
                    $selectedBonus[] = $value->id;
                }
            }
            $selectedAreas = [];
            if (!empty($institutionProgram->studyAreas)) {
                foreach ($institutionProgram->studyAreas as $key => $value) {
                    $selectedAreas[] = $value->id;
                }
            }

            return compact('title', 'image', 'institutions', 'countries', 'educationLevels', 'studyTypes', 'studyAreas', 'studyDurations', 'currencies', 'bonuses', 'languages', 'exams', 'institutionProgram', 'selectedAreas', 'selectedBonus', 'states', 'cities', 'months', 'dates');
        } else {
            abort(404);
        }

    }

    public function update(array $data, int $id)
    {
        //dd($data);
        try {
            // DB::beginTransaction();
            if ((int)$data['scholarship_type'] == 1) {
                $scholarship = $data['scholarship'];
            } else {
                $scholarship = ($data['tuition_fees'] * $data['scholarship']) / 100;
            }
            //dd($scholarship);
            $program = InstitutionProgram::find($id);
            $program->institution_id = $data['institution_id'];
            $program->country_id = $data['country_id'];
            $program->state_id = $data['state_id'];
            $program->city_id = $data['city_id'];
            $program->subject_ranking = $data['subject_ranking'];
            $program->gpa = $data['gpa'] ?? NULL;
            $program->current_degree_level_id = $data['current_degree_id'] ?? NULL;
            $program->degree_level_id = $data['degree_level_id'] ?? NULL;
            $program->study_type_id = $data['study_type_id'] ?? NULL;
            $program->study_duration_id = $data['study_duration_id'] ?? NULL;
            $program->language_id = $data['language_id'] ?? NULL;
            $program->currency_id = $data['currency_id'] ?? NULL;
            $program->application_fee = $data['application_fee'] ?? NULL;
            $program->unirep_id = auth()->user()->id;
            $program->tuition_fees = $data['tuition_fees'] != NULL ? $data['tuition_fees'] : '0';
            $program->fees_type = $data['fees_type'];
            $program->scholarship = $scholarship ?? 0;
            $program->scholarship_type = (int)$data['scholarship_type'] != NULL ? (int)$data['scholarship_type'] : 1;
            $program->scholarship_value = $data['scholarship'] != NULL ? $data['scholarship'] : '0';

            if (isset($data['currency_id'])) {

                $program->tuition_fees_usd = $data['tuition_fees'] != NULL ? usdCovert($data['currency_id'], $data['tuition_fees']) : '0';
                $program->scholarship_usd = $scholarship != NULL ? usdCovert($data['currency_id'], $scholarship) : '0';
            } else {
                $defaultCurrency = defaultCurrency();

                $program->tuition_fees_usd = $data['tuition_fees'] != NULL ? usdCovert($defaultCurrency->id, $data['tuition_fees']) : '0';
                $program->scholarship_usd = $scholarship != NULL ? usdCovert($defaultCurrency->id, $scholarship) : '0';
            }

            // if(isset($data['cover'])){
            //     $file = $data['cover'];
            //     $name = time().'.'.$file->getClientOriginalExtension();
            //     $file->move(Storage::disk('public')->path('program/cover'), $name);
            //     $program->cover = $name;
            // }
            if ($data['title'] != '') {
                $datas = [];
                $datas['en']['title'] = $data['title'];
                $datas['en']['description'] = $data['description'];
            }
            $program->fill($datas)->save();
            $program->save();

            if (isset($data['bonus_id'])) {
                $program->bonuses()->sync($data['bonus_id']);
            }
            if (isset($data['study_area_id'])) {
                $program->studyAreas()->sync($data['study_area_id']);
            }

            if (isset($data['deadline']) && count($data['deadline']) > 0) {
                // $deadline = [];
                InstitutionProgramDeadline::where('institution_program_id', $id)->delete();

                foreach ($data['deadline'] as $key => $value) {
                    $d['institution_program_id'] = $program->id;
                    $d['session_id'] = $value['session_id'];
                    $d['start_month'] = $value['start_month'];
                    $d['last_month'] = $value['last_month'];
                    $deadline = $d;
                    InstitutionProgramDeadline::create($deadline);
                }
            }

            if (isset($data['exam'])) {

                InstitutionProgramExamRequirement::where('institution_program_id', $id)->delete();

                foreach ($data['exam'] as $key => $value) {
                    if (isset($value['exam_id'])) {
                        $e['institution_program_id'] = $program->id;
                        $e['exam_id'] = $value['exam_id'];
                        $e['score'] = $value['total'];
                        $e['reading_score'] = 0;
                        $e['listening_score'] = 0;
                        $e['speaking_score'] = 0;
                        $e['writing_score'] = 0;
                        $exam = $e;

                        if ($value['total'] != NULL) {
                            $programRequirment = InstitutionProgramExamRequirement::create($exam);
                            foreach ($value['score'] as $subsection_score) {
                                InstitutionProgramExamRequirementDetail::updateOrCreate([
                                    'requirement_id' => $programRequirment->id,
                                    'subsection_id' => $subsection_score['key'],
                                ], [
                                    'requirement_id' => $programRequirment->id,
                                    'subsection_id' => $subsection_score['key'],
                                    'score' => $subsection_score['value'],
                                ]);
                            }
                        }
                    }
                }
            }


        } catch (\Exception $e) {
            // DB::rollBack();
            throw $e;
        }
    }

    public function programRating(array $data)
    {
        $checkUser=ProgramRating::where([['student_id',auth()->check() ? auth()->user()->id : ''],['institution_program_id',$data['program_id']]])->first();
        if(filled($checkUser)){
            return redirect()->back()->with('success', 'You have already given rating to this program.');
        }

        ProgramRating::create([
            'rating' => $data['program_rating'] ?? 0,
            'review' => $data['program_comment'] ?? null,
            'student_id' => auth()->check() ? auth()->user()->id : '',
            'institution_program_id' => $data['program_id'],
            'is_active' => 1,
        ]);
        return redirect()->back()->with('success', 'Program  rating added successfully.');
        //return response()->json(['success' => true, 'message' => 'Program  rating added successfully.']);
    }

    public function singleProgram($id)
    {
        dd('sdfds');
        $institutionProgram = InstitutionProgram::with('bonuses')->find($id);
        $total_rating = $institutionProgram->program_ratings->count();
        dd($institutionProgram->program_ratings);
        $program_ratings = $institutionProgram->program_ratings->groupBy('rating')->map(function ($programRating) use ($total_rating) {
            return $programRating->count() / $total_rating * 100;
        });
        $unirep_id = $institutionProgram->unirep_id;
        $otherPrograms = InstitutionProgram::when($unirep_id, function ($query) use ($unirep_id, $id) {
            $query->where([['unirep_id', $unirep_id], ['id', '!=', $id]]);
        })->take(4)->inRandomOrder()->get();
        $title = 'Programs';
        $image = 'student.jpg';
        $institutions = Institution::get();
        $countries = Country::get();
        $educationLevels = EducationLevel::get();
        $studyTypes = StudyType::get();
        $studyAreas = StudyArea::get();
        $studyDurations = StudyDuration::get();
        $currencies = Currency::get();
        $bonuses = Bonus::get();
        $languages = Language::get();
        $exams = Exam::get();

        $locale = Locale::get();
        $default_lang = defaultLanguage();

        $defaultCurrency = defaultCurrency();

        $selectedBonus = [];
        if (!empty($institutionProgram->bonuses)) {
            foreach ($institutionProgram->bonuses as $key => $value) {
                $selectedBonus[] = $value->id;
            }
        }
        $selectedAreas = [];
        if (!empty($institutionProgram->studyAreas)) {
            foreach ($institutionProgram->studyAreas as $key => $value) {
                $selectedAreas[] = $value->id;
            }
        }

        return compact('title', 'image', 'program_ratings', 'institutions', 'countries', 'educationLevels', 'studyTypes', 'studyAreas', 'studyDurations', 'currencies', 'bonuses', 'languages', 'exams', 'institutionProgram', 'selectedBonus', 'selectedAreas', 'locale', 'default_lang', 'defaultCurrency', 'otherPrograms');
    }
}

?>

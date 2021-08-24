<?php
namespace App\Repositories;

use App\Contracts\InstitutionProgramContract;
use App\Model\Institution;
use App\Model\InstitutionProgram;
use App\Model\Country;
use App\Model\Session;
use App\Model\State;
use App\Model\City;
use App\Model\EducationLevel;
use App\Model\StudyType;
use App\Model\StudyArea;
use App\Model\StudyDuration;
use App\Model\Currency;
use App\Model\Bonus;
use App\Model\Language;
use App\Model\Locale;
use App\Model\Exam;
use App\Model\InstitutionProgramExamRequirement;
use App\Model\InstitutionProgramDeadline;
use App\Model\InstitutionProgramBonus;
use App\Model\InstitutionProgramStudyArea;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class InstitutionProgramRepository implements InstitutionProgramContract
{
    /**
     * store new state in database
     *
     * @param array $data
     *
     * @return \App\Models\State
     */
    public function edit($id)
    {
        $institutionProgram = InstitutionProgram::with('bonuses')->find($id);
        if (!empty($institutionProgram)) {
            $title = 'Programs';
            $image = 'student.jpg';
            $institutions = Institution::get();
            $countries = Country::get();
            $educationLevels = EducationLevel::get();
            $studyTypes = StudyType::get();
            $sessions = Session::get();
            $studyAreas = StudyArea::get();
            $studyDurations = StudyDuration::get();
            $currencies = Currency::get();
            $bonuses = Bonus::get();
            $languages = Language::get();
            $exams = Exam::get();
            $months = listMonth();
            $dates = [];

            $locale = Locale::get();
            $default_lang = defaultLanguage();

            $country_id = old('country_id') ? old('country_id') : $institutionProgram->country_id;
            $states = State::where('country_id', (int)$country_id)->get();
            $cities = City::where('country_id', (int)$country_id);
            if(count($states)) {
                $state_id = old('state_id') ? old('state_id') : $institutionProgram->state_id;
                $cities->where('state_id', (int)$state_id);
            }
            $cities = $cities->get();

            $selectedBonus = [];
            if(!empty($institutionProgram->bonuses)){
                foreach ($institutionProgram->bonuses as $key => $value) {
                   $selectedBonus[] = $value->id;
                }
            }
            $selectedAreas = [];
            if(!empty($institutionProgram->studyAreas)){
                foreach ($institutionProgram->studyAreas as $key => $value) {
                   $selectedAreas[] = $value->id;
                }
            }

            return view('admin.institution_program.edit' , compact('title' ,'image' ,'institutions' ,'countries' ,'educationLevels','sessions' ,'studyTypes' ,'studyAreas' ,'studyDurations' ,'currencies' ,'bonuses' ,'languages' ,'exams' ,'institutionProgram' ,'selectedAreas' ,'selectedBonus', 'states', 'cities', 'months', 'dates','locale' ,'default_lang'));
        } else {
            abort(404);
        }

    }

    public function view($id)
    {
        $institutionProgram = InstitutionProgram::with('bonuses')->find($id);
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
        if(!empty($institutionProgram->bonuses)){
            foreach ($institutionProgram->bonuses as $key => $value) {
               $selectedBonus[] = $value->id;
            }
        }
        $selectedAreas = [];
        if(!empty($institutionProgram->studyAreas)){
            foreach ($institutionProgram->studyAreas as $key => $value) {
               $selectedAreas[] = $value->id;
            }
        }

        return view('admin.institution_program.view' ,compact('title' ,'image' ,'institutions' ,'countries' ,'educationLevels' ,'studyTypes' ,'studyAreas' ,'studyDurations' ,'currencies' ,'bonuses' ,'languages' ,'exams' ,'institutionProgram' ,'selectedBonus' ,'selectedAreas' ,'locale' ,'default_lang' ,'defaultCurrency'));
    }

    /**
     * update state in database
     *
     * @param array $data
     * @param int $id
     *
     * @return \App\Models\State
     */
    public function update(array $data, int $id)
    {
         try {
            // DB::beginTransaction();
            $institution = Institution::find($data['institution_id']);

            $program = InstitutionProgram::find($id);
            $program->institution_id = $data['institution_id'];
            $program->country_id = $data['country_id'];
            $program->subject_ranking = $data['subject_ranking'];
            $program->gpa = $data['gpa'] ?? NULL;
            $program->current_degree_level_id = $data['current_degree_id'] ?? NULL;
            $program->degree_level_id = $data['degree_level_id'] ?? NULL;
            $program->study_type_id = $data['study_type_id'] ?? NULL;
            $program->study_duration_id = $data['study_duration_id'] ?? NULL;
            $program->language_id = $data['language_id'] ?? NULL;
            $program->currency_id = $data['currency_id'] ?? NULL;
            $program->unirep_id = is_null($institution) ?: $institution->unirep_id;
            $program->tuition_fees = $data['tuition_fees'] != NULL ? $data['tuition_fees'] : '0';
            $program->fees_type = $data['fees_type'];
            $program->scholarship = $data['scholarship'] != NULL ? $data['scholarship'] : '0';

            $institution->qs_ranking=$data['qs_ranking'] ?? NULL;
            $institution->faculty=$data['faculty'] ?? NULL;
            $institution->save();

             if (isset($data['currency_id'])) {

                $program->tuition_fees_usd = $data['tuition_fees'] != NULL ? usdCovert($data['currency_id'],$data['tuition_fees']) : '0';
                $program->scholarship_usd = $data['scholarship'] != NULL ? usdCovert($data['currency_id'],$data['scholarship']) : '0';
            } else{
                $defaultCurrency = defaultCurrency();

                $program->tuition_fees_usd = $data['tuition_fees'] != NULL ? usdCovert($defaultCurrency->id,$data['tuition_fees']) : '0';
                $program->scholarship_usd = $data['scholarship'] != NULL ? usdCovert($defaultCurrency->id,$data['scholarship']) : '0';
            }


            // if(isset($data['cover'])){
            //     $file = $data['cover'];
            //     $name = time().'.'.$file->getClientOriginalExtension();
            //     $file->move(Storage::disk('public')->path('program/cover'), $name);
            //     $program->cover = $name;
            // }

            foreach ($data['program'] as $key => $value) {
                if($value['title'] != NULL)
                {
                    $d['title'] = $value['title'];
                    $d['description'] = $value['description'] ?? NULL;
                    $datas[$key] = $d;
                }
            }

            $program->fill($datas)->save();
            $program->save();

            if(isset($data['bonus_id']))
            {
                $program->bonuses()->sync($data['bonus_id']);
            }
            if(isset($data['study_area_id']))
            {
                $program->studyAreas()->sync($data['study_area_id']);
            }

            if (isset($data['deadline']) &&  count($data['deadline']) > 0) {
                // $deadline = [];
                InstitutionProgramDeadline::where('institution_program_id',$id)->delete();

                foreach($data['deadline'] as $key => $value) {
                    $d['institution_program_id'] = $program->id;
                    $d['session_id'] = $value['session_id'];
                    $d['start_month'] = $value['start_month'];
                    $d['last_month'] = $value['last_month'];
                    $deadline = $d;
                    InstitutionProgramDeadline::create($deadline);
                }
            }

            if(isset($data['exam_id']) && $data['exam_id'] != ''){

                InstitutionProgramExamRequirement::where('institution_program_id',$id)->delete();

                foreach ($data['exam'] as $key => $value) {
                    $e['institution_program_id'] = $program->id;
                    $e['exam_id'] = $data['exam_id'];
                    $e['score'] = $value['total'];
                    $e['reading_score'] = $value['reading_score'];
                    $e['listening_score'] = $value['listening_score'];
                    $e['speaking_score'] = $value['speaking_score'];
                    $e['writing_score'] = $value['writing_score'];
                    $exam = $e;

                    if($value['total'] != NULL)
                    {
                        InstitutionProgramExamRequirement::create($exam);
                    }
                }
            }


        }catch (\Exception $e) {
            // DB::rollBack();
            throw $e;
        }
    }

    /**
     * delete state from database
     *
     * @param int $id
     *
     * @return boolean
     */
    public function delete(int $id)
    {
        InstitutionProgramExamRequirement::where('institution_program_id',$id)->delete();
        InstitutionProgramDeadline::where('institution_program_id',$id)->delete();
        InstitutionProgramBonus::where('institution_program_id',$id)->delete();
        InstitutionProgramStudyArea::where('institution_program_id',$id)->delete();
        return InstitutionProgram::where('id',$id)->delete();
    }

     public function programSlug($slug, $i = 0)
    {
        $count = InstitutionProgram::where('slug',$slug)->count();

        if($count == 0)
            return $slug;

        return $this->programSlug($slug.rand(1, 99));
    }

    public function changeFeature(int $id)
    {
        $institutionProgram = InstitutionProgram::find($id);
        $institutionProgram->is_featured = ($institutionProgram->is_featured == 0 ? 1 : 0 );
        $institutionProgram->save();

        return response()->json(['success' => true]);
    }

     public function changeActive(int $id)
    {
        $institutionProgram = InstitutionProgram::find($id);
        $institutionProgram->is_active = ($institutionProgram->is_active == 0 ? 1 : 0 );
        $institutionProgram->save();

        return response()->json(['success' => true]);
    }
}

?>

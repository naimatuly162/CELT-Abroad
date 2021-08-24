<?php
namespace App\Scopes;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Scope;

class StuduntProgramEligibilityScope implements Scope
{
    public function apply(Builder $builder, Model $model) {
        $student = auth()->user()->load(['studentEducation', 'testScore', 'testScores']);

        // $student->studentEducation->study_area_id,
        // $student->testScore->exam_id,
        // $student->testScore->overal_score,
        // $student->studentEducation->study_start_date,
        // $student->studentEducation->study_start_date,
        // $student->studentEducation->edu_country_id,
        // $student->studentEducation->edu_highest_level_id);

        $builder->addSelect('institution_programs.*')->distinct()
        ->leftJoin('institution_program_translations as ipt', function($join) {
            $join->on('ipt.institution_program_id',  'institution_programs.id')->where('ipt.locale', 'en');
        });
       // dd($student->studentEducation);
        if($student->studentEducation){
            $builder->leftJoin('institution_program_study_areas as ipsa', function($join) use ($student) {
                $join->on('ipsa.institution_program_id', 'institution_programs.id')
                        ->whereIn('ipsa.study_area_id', $student->studentEducation->study_area_id);
            })

            // ->leftJoin('institution_program_exam_requirements as iper', function($join) use ($student) {
            //     $join->on('iper.institution_program_id', 'institution_programs.id');
            //     if($student->testScores) {
            //         foreach($student->testScores as $testScoreIndex => $testScore) {
            //             if($testScoreIndex==0) {
            //                 $join->where(function($q) use($testScore){
            //                     $q->where('iper.exam_id', $testScore->exam_id)
            //                     ->where('score', '<=', $testScore->overal_score);
            //                 });
            //             } else {
            //                 $join->orWhere(function($q) use($testScore){
            //                     $q->where('iper.exam_id', $testScore->exam_id)
            //                     ->where('score', '<=', $testScore->overal_score);
            //                 });
            //             }

            //         }
            //     }
            // })

            // ->leftJoin('institution_program_deadlines as ipd', function($join) use ($student) {
            //     $study_start_season = $student->studentEducation->study_start_season;
            //     $study_start_year = $student->studentEducation->study_start_year;
            //     $season_months = getStudySeasonsMonths($study_start_season);
            //     $season_months = "'" . implode(',', $season_months) . "'";
            //     $months_list = json_encode(getAllMonths());

            //     $join->on('iper.institution_program_id', 'institution_programs.id')
            //         ->whereRaw("FIND_IN_SET( LOWER( monthname(str_to_date(CONCAT('".$study_start_year."-',start_month,'-01'),'%Y-%m-%d')) ) , ".$season_months.")")
            //         ->whereRaw("FIND_IN_SET( LOWER( monthname(str_to_date(CONCAT('".$study_start_year."-',last_month,'-01'),'%Y-%m-%d')) ), ".$season_months.")")
            //         ->whereRaw(' YEAR(now()) = ' . $study_start_year);
            // })

            //->whereIn('institution_programs.country_id', $student->studentEducation->dest_country_id)
            //->where('institution_programs.gpa', '>=',$student->studentEducation->gpa_per)
            ->where('institution_programs.degree_level_id', $student->studentEducation->edu_highest_level_id);
        }

        $builder->where('institution_programs.is_active', 1);
    }
}

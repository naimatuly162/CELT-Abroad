<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use DB;
use App\Mail\ProgramEligibleStudentMail;
use App\Model\InstitutionProgram;
use App\Model\InstitutionProgramNotifyTrack;
use Illuminate\Support\Facades\Mail;

class NotifyEligibleStudentForProgram extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'institution-programs:notify-eligible-student';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'notify about institution program to those student who are eligibles';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $data = DB::table('users')

        ->crossJoin('institution_programs')

        ->join('user_education_details as ued', 'ued.user_id', '=','users.id')
        
        ->join('user_test_scores as uts', 'uts.user_id', '=','users.id')

        ->join('institution_program_translations as ipt', function($join) {
            $join->on('ipt.institution_program_id',  'institution_programs.id')
            ->where('ipt.locale', 'en');
        })
        
        ->join('institution_program_study_areas as ipsa', function($join) {
            $join->on('ipsa.institution_program_id', 'institution_programs.id')
                    ->whereRaw('FIND_IN_SET(ipsa.study_area_id, ued.study_area_id) > 0');
        })

        ->join('institution_program_exam_requirements as iper', function($join) {
            $join->on('iper.institution_program_id', 'institution_programs.id')
                ->whereRaw('iper.exam_id = uts.exam_id')
                ->whereRaw('score <= uts.overal_score');
        })

        ->join('institution_program_deadlines as ipd', function($join) {
            $months_list = json_encode(getAllMonths());
            $join->on('iper.institution_program_id', 'institution_programs.id')
                // ->whereRaw('start_date <= DAY(ued.study_start_date)')
                // ->whereRaw('start_month <= MONTH(ued.study_start_date)')
                // ->whereRaw('last_date >= DAY(ued.study_start_date)')
                // ->whereRaw('last_month >= MONTH(ued.study_start_date)');
                ->whereRaw("CASE
                    WHEN `ued`.`study_start_season` = 'spring' THEN FIND_IN_SET( monthname(str_to_date(CONCAT(ued.study_start_year,'-',start_month,'-01'),'%Y-%m-%d')), 'march,april,may') 
                    WHEN `ued`.`study_start_season` = 'summer' THEN FIND_IN_SET( monthname(str_to_date(CONCAT(ued.study_start_year,'-',start_month,'-01'),'%Y-%m-%d')), 'june,july,august') 
                    WHEN `ued`.`study_start_season` = 'autumn' THEN FIND_IN_SET( monthname(str_to_date(CONCAT(ued.study_start_year,'-',start_month,'-01'),'%Y-%m-%d')), 'september,october,november') 
                    WHEN `ued`.`study_start_season` = 'winter' THEN FIND_IN_SET( monthname(str_to_date(CONCAT(ued.study_start_year,'-',start_month,'-01'),'%Y-%m-%d')), 'december,january,february')
                END")
                ->whereRaw("CASE
                    WHEN `ued`.`study_start_season` = 'spring' THEN FIND_IN_SET( monthname(str_to_date(CONCAT(ued.study_start_year,'-',last_month,'-01'),'%Y-%m-%d')), 'march,april,may') 
                    WHEN `ued`.`study_start_season` = 'summer' THEN FIND_IN_SET( monthname(str_to_date(CONCAT(ued.study_start_year,'-',last_month,'-01'),'%Y-%m-%d')), 'june,july,august') 
                    WHEN `ued`.`study_start_season` = 'autumn' THEN FIND_IN_SET( monthname(str_to_date(CONCAT(ued.study_start_year,'-',last_month,'-01'),'%Y-%m-%d')), 'september,october,november') 
                    WHEN `ued`.`study_start_season` = 'winter' THEN FIND_IN_SET( monthname(str_to_date(CONCAT(ued.study_start_year,'-',last_month,'-01'),'%Y-%m-%d')), 'december,january,february')
                END")
                ->whereRaw('`ued`.`study_start_year` = YEAR(now())');
        })
        
        ->whereRaw('institution_programs.is_active = 1')
        ->whereRaw('FIND_IN_SET(institution_programs.country_id, ued.dest_country_id) > 0')
        ->whereRaw('institution_programs.current_degree_level_id = ued.edu_highest_level_id')
        ->whereRaw('institution_programs.gpa <= ued.gpa_per')
        ->whereRaw('(`users`.`id`, `institution_programs`.`id`) NOT IN (SELECT `student_id`, `institution_program_id` FROM `institution_program_notify_tracks` )')
        ->get(['users.id', 'users.first_name', 'users.email', 'institution_programs.id as institution_program_id', 'institution_programs.slug as institution_program_slug']);

        foreach($data as $student) {
            $program = InstitutionProgram::find($student->institution_program_id);
            $send = Mail::to($student->email)->send(new ProgramEligibleStudentMail($program, $student));
            InstitutionProgramNotifyTrack::create([        
                'institution_program_id' => $student->institution_program_id,
                'student_id' => $student->id,
            ]);
        }
    }
}

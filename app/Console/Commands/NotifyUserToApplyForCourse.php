<?php

namespace App\Console\Commands;

use App\Mail\sendProgramSuggetion;
use App\Model\CountryWiseEducation;
use App\Model\InstitutionProgram;
use App\Model\User;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;

class NotifyUserToApplyForCourse extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'notifyusertoapplyforcource';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'this command will notify users every week to apply to any course if they dont have apply to any cource yet';

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
        $users=DB::select('SELECT * FROM users WHERE status = 1 and DATE(created_at) < DATE(NOW() - INTERVAL 1 DAY) and id NOT IN (SELECT student_id from applications)');
        if(!empty($users)){
            foreach ($users as $u){
                if($u){
                    $user=User::with('studentEducation')->where('id',$u->id)->where('status', '1')->first();
                    if(!empty($user) && isset($user->studentEducation)){
                        $user_edu_country_id=$user->studentEducation->edu_country_id;
                        $user_edu_edu_highest_level=$user->studentEducation->edu_highest_level_id;
                        $eligeble_program_country_wise=CountryWiseEducation::where('residential_country_id',$user_edu_country_id)->where('residential_degree_id',$user_edu_edu_highest_level)->get();
                        if(count($eligeble_program_country_wise) > 0){
                            foreach ($eligeble_program_country_wise as $el){
                                $destination_country_id[]=$el->destination_country_id;
                                $destination_degree_id[]=$el->destination_degree_id;
                            }
                        }else{
                            $destination_country_id=[];
                            $destination_degree_id=[];
                        }
                    }else{
                        $destination_country_id=[];
                        $destination_degree_id=[];
                    }

                }else{
                    $destination_country_id=[];
                    $destination_degree_id=[];
                }
                $institutionPrograms = InstitutionProgram::active()->has('translation')->with(['happyStudent', 'exam'])->whereIn('country_id',$destination_country_id)->whereIn('current_degree_level_id',$destination_degree_id)->orderBy('institution_programs.id','desc')->get();
                $eligibleprogram=[];
                if(!empty($institutionPrograms)){
                    foreach ($institutionPrograms as $key => $program){
                        $iseligible=$program->isEligibility($user);
                        if($iseligible){
                            $eligibleprogram[$key]['id']=$program->id;
                            $eligibleprogram[$key]['slug']=$program->slug;
                            $eligibleprogram[$key]['title']=$program->title;
                        }
                    }
                }
                if(!empty($u->id) && count($eligibleprogram) > 0){
                    \Log::info($u->id);
                    Mail::to($user->email)->send(new sendProgramSuggetion($user, array_values($eligibleprogram)));
                }
            }
        }
    }
}

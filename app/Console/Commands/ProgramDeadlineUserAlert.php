<?php

namespace App\Console\Commands;

use App\Mail\programdeadlinealert;
use App\Model\CountryWiseEducation;
use App\Model\InstitutionProgram;
use App\Model\InstitutionProgramTranslation;
use App\Model\User;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class ProgramDeadlineUserAlert extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'programdeadlinealert';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'this command is run to alert user for programs deadline before 1 month';

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
        $users=User::where('status',1)->get();
        if(count($users) > 0){
            foreach ($users as $u){
                $user=User::with('studentEducation')->where('id',$u->id)->where('status', '1')->first();
                if(isset($user->studentEducation) && !empty($user->studentEducation)){
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
                $deadlineDate=Carbon::now()->addMonth()->format('m');
                DB::enableQueryLog();
                $institutionPrograms = InstitutionProgram::active()->has('translation')->join('institution_program_deadlines','institution_program_deadlines.institution_program_id','institution_programs.id')->whereIn('country_id',$destination_country_id)->whereIn('current_degree_level_id',$destination_degree_id)->where('institution_program_deadlines.last_month','=',$deadlineDate)->orderBy('institution_programs.id','desc')->groupBy('institution_programs.id')->select('institution_programs.*')->get();

                $eligibleprogram=[];
                if(!empty($institutionPrograms)){

                    foreach ($institutionPrograms as $key => $program){
                       /* $iseligible=$program->isEligibility($user);
                        if($iseligible){*/
                            $programName=InstitutionProgramTranslation::where('institution_program_id',$program->id)->where('locale','en')->first();
                            $eligibleprogram[$key]['id']=$program->id;
                            $eligibleprogram[$key]['slug']=$program->slug;
                            $eligibleprogram[$key]['title']=$programName->title;
                        //}
                    }
                }
                //\Log::info($eligibleprogram);
                if(!empty($u->id) && count($eligibleprogram) > 0){
                    \Log::info($u->id);
                    Mail::to($u->email)->send(new programdeadlinealert($user, array_values($eligibleprogram)));
                }
            }
        }
    }
}

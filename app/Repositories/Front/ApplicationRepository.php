<?php
namespace App\Repositories\Front;

use App\Contracts\Front\ApplicationContract;
use App\Model\Application;
use App\Model\Bonus;
use App\Model\ApplicationBonus;
use App\Mail\ApplicationStatusEmail;
use App\Mail\ApplicationBonusMail;
use Illuminate\Support\Facades\Mail;

class ApplicationRepository implements ApplicationContract
{
    public function index($status=null)
    {

        $title = trans('header.application');
        $image = 'univ.jpg';

        $applications = Application::whereHas('program', function($q){
                        $q->where('unirep_id',auth()->guard('unirep')->user()->id);})->with('student.testScore.exam','student.testScore.subsectionSection','student.testScore.subsectionSection.subsectiondetail')->get();

        $rejectedApplication = [];
        $acceptedApplication = [];
        $pendingApplication = [];

        if (count($applications) > 0 ) {
            foreach ($applications as $key => $value) {
                if($value['status'] == 2){
                    $acceptedApplication[] = $value;
                }
            }

            $acceptedApplications = collect($acceptedApplication);

            foreach ($applications as $key => $value) {
                if($value->status == 3){
                    $rejectedApplication[] = $value;
                }
            }

            foreach ($applications as $key => $value) {
                if($value->status == 1){
                    $pendingApplication[] = $value;
                }
            }
        }

        $path = route('unirep.application');
        $allApplications = paginate($applications);
        $allPendingApplications = paginate($pendingApplication);
        $allAcceptedApplications = paginate($acceptedApplication);
        $allRejectedApplications = paginate($rejectedApplication);

        $bonuses = Bonus::get();
        $defaultCurrency = defaultCurrency();
        $program_likes = programLikes();
//        $status       = $status;

        return view('front.application.index' ,compact('status','title' ,'image' ,'applications' ,'bonuses' ,'defaultCurrency' ,'program_likes' ,'acceptedApplication' ,'rejectedApplication' ,'pendingApplication' ,'allAcceptedApplications' ,'allRejectedApplications' ,'allPendingApplications' ,'allApplications' ,'status'));
    }

    public  function changeStatus(array $data)
    {
    	Application::where('program_id',$data['id'])->where('student_id' ,$data['student_id'])->update(['status' => $data['status']]);

    	$application = Application::where('program_id',$data['id'])->where('student_id' ,$data['student_id'])->first();

    	$unirep = auth()->user();

    	$status = '';
    	if($data['status'] == 2) {
    		$status = 'Accept';
    	}else {
    		$status = 'Reject';
    	}

    	Mail::to($unirep->email)->send(new ApplicationStatusEmail($application->program,$unirep,$status));

    	if ($data['status'] == 2) {
    		return response()->json(['success' => true ,'message' => 'Application is accepted successfully']);
    	} else {
    		return response()->json(['success' => true ,'message' => 'Application is rejected successfully.']);
    	}
    }

    public function giveBonus(array $data)
    {
        $defaultCurrency = defaultCurrency();

        /*$application = Application::where('program_id',$data['program_id'])->where('student_id' ,$data['student_id'])->update(['bonus_id' => $data['bonus_id'], 'amount' => $data['amount'] , 'amount_usd' => usdCovert($defaultCurrency->id,$data['amount'])]);*/

        $application = Application::where('program_id',$data['program_id'])->where('student_id' ,$data['student_id'])->first();

        if($application) {
            ApplicationBonus::create([
                'application_id'=>$application->id,
                'bonus_id'=>$data['bonus_id'],
                'amount'=>$data['amount'],
                'amount_usd'=>usdCovert($defaultCurrency->id,$data['amount']),
            ]);
            $applications = Application::where('program_id',$data['program_id'])->where('student_id' ,$data['student_id'])->first();

            $unirep = auth()->user();
            Mail::to($unirep->email)->send(new ApplicationBonusMail($applications->program,$unirep));

            return response()->json(['success' => true ,'message' => 'Bonus successfully given to application']);
        } else {
            return response()->json(['success' => false ,'message' => 'Something went wrong']);
        }
    }
}

?>

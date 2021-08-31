<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Model\Application;
use App\Model\StateTranslation;
use Illuminate\Http\Request;
use App\Contracts\Front\UniversityContract;
use App\Model\Institution;
use App\Model\State;

class UniversityController extends Controller
{
    protected $universityService;

    public function __construct(UniversityContract $universityService)
    {
        $this->universityService = $universityService;
    }

    public function index(Request $request)
    {

        return $this->universityService->index($request);
    }

    public function viewAll()
    {
        return $this->universityService->viewAll();
    }

    public function view($university)
    {
        return  $this->universityService->view($university);
    }

    public function getUniversity($state, $city = NULL)
    {
        $statename = $state;
        $state_translation = StateTranslation::where('locale','en')->whereRaw("REPLACE(title,' ','-') = '{$state}'")->first();
        $state=State::where('id',$state_translation->state_id)->first();
        return $this->universityService->getUniversity($state, $city);
    }


    ///....design_tuly......//


    public function institute()
    {

        return view('front.rep_new_design.pages.institute');
    }
    public function application( $status =NULL)
    {
        // dd($status);
        $application = new Application();
        $application->status = $status;
        $application->save();

        return view('front.rep_new_design.pages.application');
    }





}

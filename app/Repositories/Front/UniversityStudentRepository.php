<?php
namespace App\Repositories\Front;

use App\Contracts\Front\UniversityStudentContract;
use App\Model\Application;
use App\Model\User;
use App\Model\StudyArea;
use App\Model\Exam;
use App\Model\Country;
use App\Model\EducationLevel;
use App\Model\GradingScheme;

class UniversityStudentRepository implements UniversityStudentContract
{
    public function index()
    {
    	$title = trans('home.students');
        $image = 'student.jpg';   
        $defaultCurrency = defaultCurrency();
        $program_likes = programLikes();

        $students = Application::whereHas('program', function($q){
                        $q->where('unirep_id',auth()->user()->id)->where('status',2);})->with('student.testScore.exam','program');

        if(request()->search)  {
            $students->whereHas('student',function($query) {
                $query->where('first_name', 'like', '%'.request()->search.'%')->orWhere('last_name', 'like' , '%'.request()->search.'%');
            });
        }

        $students = $students->paginate(6);

        if(request()->search) {
            $students->appends(request()->except(['page','_token']));
        }

        return view('university.student.index' ,compact('title', 'image' ,'students' ,'defaultCurrency' , 'program_likes'));
    }

    public function view($slug)
    {
    	$title = trans('home.students');
        $image = 'student.jpg'; 
        $defaultCurrency = defaultCurrency();
        $data = explode('-', $slug);
        $student = User::where('first_name',$data[0])->where('last_name',$data[1])->first();

        $eduLevels = EducationLevel::get();
        $studyAreas = StudyArea::get();
        $exams = Exam::get();
        $countries = Country::get();
        $grades = GradingScheme::get();

        if(empty($student))
        { 
            return redirect()->back();
        }

        return view('university.student.view' ,compact('title', 'image','defaultCurrency', 'student' ,'eduLevels' ,'studyAreas' ,'exams' ,'countries' ,'grades'));
    }
}

?>
<?php
namespace App\Repositories\Front;

use App\Contracts\Front\ScholarshipContract;
use App\Model\InstitutionProgram;
use App\Model\Country;

class ScholarshipRepository implements ScholarshipContract
{

    public function index()
    {
        $title = trans('header.scholarships');
        $image = 'univ.jpg';
        $programs = InstitutionProgram::active()->has('translation')->orderBy('id','desc')->where('is_featured',1)->paginate(6);
        $defaultCurrency = defaultCurrency();
        $program_likes = programLikes();

        //get countries order by high priority of university
        $countries = getCountry()->get();
        
        return view('front.scholarship.index' ,compact('title' ,'image' ,'programs' ,'defaultCurrency', 'countries', 'program_likes'));  
    }

    public function view($scholarship)
    {
        $institutionProgram = InstitutionProgram::where('slug',$scholarship)->first();
        if(!empty($InstitutionProgram)) {
             $title = $institutionProgram->title;
            $image = 'student.jpg';
            $program_likes = programLikes();

            $defaultCurrency = defaultCurrency();

            return view('front.program.view' ,compact('institutionProgram' ,'title' ,'image', 'defaultCurrency', 'program_likes'));
        } else {
            abort(404);
        }
       
    }

    public function viewAll()
    {
        $title = trans('program.all_scholarships');
        $image = 'univ.jpg';
        $programs = InstitutionProgram::active()->has('translation')->orderBy('id','desc')->paginate(6);
        $defaultCurrency = defaultCurrency();
        $countries = Country::with(['institute', 'translation'])
                        ->withCount('institute')
                        ->orderBy('institute_count', 'desc')
                        ->get();
        $program_likes = programLikes();

        return view('front.scholarship.all-scholarship' ,compact('countries', 'title', 'image' ,'programs' ,'defaultCurrency', 'program_likes'));
    }
}

?>
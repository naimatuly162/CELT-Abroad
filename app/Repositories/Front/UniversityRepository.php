<?php
namespace App\Repositories\Front;

use App\Contracts\Front\UniversityContract;
use App\Model\Institution;
use App\Model\EducationLevel;
use App\Model\Country;
use App\Model\State;
use App\Model\City;
use App\Model\FAQ\Faq;
use App\Model\StudyArea;

/**
 * @method \App\Model\Institution store(array $data)
 * @method \App\Model\Institution update(array $data, int $id)
 * @method \App\Model\Institution delete(int $id)
 */
class UniversityRepository implements UniversityContract
{
    public function index($request)
    {
        $queryParams = [];
        if (count($request->all()) > 0) {
            $queryParams = $request->all();
        }
        $title = trans('institution.universities');
        $image = 'univ.jpg';
        $institutions = Institution::active()->has('translation')->has('programs')->orderBy('id','desc')->where('is_featured',1)->get();
        $countries = getCountry()->get();
        $university_likes = universityLikes();
        $program_likes = programLikes();

        $sortingOptions = [
            'asc' => 'Sort by University Name (A-Z)',
            'desc' => 'Sort by University Name (Z-A)',
        ];

        $education_labels = EducationLevel::get();
        $education = [];
        if (filled($education_labels)) {
            foreach ($education_labels as $edu) {
                $education[$edu->id] = $edu->title;
            }
        }

        $countries = Country::get();
        $country = [];
        if (filled($countries)) {
            foreach ($countries as $singleCountry) {
                $country[$singleCountry->id] = $singleCountry->title;
            }
        }
        $filterOptions = [
            'sort_by' => $sortingOptions,
            'education_label' => $education,
            'country' => $country,
        ];

        $studyAreas = StudyArea::withCount('disciplines')->get();
        $ins = Institution::query();
        $scholarshipCollection = $ins->active();
        if (array_key_exists("filter_sort_by", $queryParams) && $queryParams['filter_sort_by'] != null) {
            $scholarshipCollection = $scholarshipCollection->orderBy('slug', $queryParams['filter_sort_by']);
        }
        if (array_key_exists("filter_education_label", $queryParams) && $queryParams['filter_education_label'] != null) {
            $degree_label_id = $queryParams['filter_education_label'];
            $scholarshipCollection = $scholarshipCollection->whereHas('programs', function ($query) use ($degree_label_id) {
                $query->where('degree_level_id', $degree_label_id);
            })->with('programs');
        }
        if (array_key_exists("filter_country", $queryParams) && $queryParams['filter_country'] != null) {

            $scholarshipCollection = $scholarshipCollection->where('country_id', $queryParams['filter_country']);
        }
        $institutions = $scholarshipCollection->has('translation')->has('programs')->orderBy('id', 'desc')->where('is_featured', 1)->paginate(6);

        $universities = $scholarshipCollection->with('programs')->paginate(5);
        $institute_programs = $scholarshipCollection->with('programs.happyStudent')->whereHas('programs')->get();
        $top_institutes = $institute_programs->sortByDesc('happy_student_count')->values()->all();


//        return view('front.university.index' ,compact('countries', 'title' ,'image' ,'institutions', 'university_likes' ,'program_likes'));
        return view('front.design.pages.university' ,compact('countries','studyAreas','universities', 'top_institutes','queryParams','filterOptions','title' ,'image' ,'institutions', 'university_likes' ,'program_likes'));
    }

    public function view($university)
    {
        $institution = Institution::where('slug',$university)->first();

        if(!empty($institution)){
            $title = $institution->title;
            $image = 'univ.jpg';
            $educationLevels = EducationLevel::all();
            $defaultCurrency = defaultCurrency();
            $university_likes = universityLikes();
            $uni_faqs = Faq::where('type', '0')->get();
            $program_likes = programLikes();

            $scholarships = [];
            if (count($institution->programs) > 0) {
                foreach ($institution->programs as $key => $value) {
                    if($value['scholarship'] != 0 && $value['scholarship'] != '')
                    {
                        $scholarships[] = $value;
                    }
                }
            }

            return view('front.institution.view' ,compact('title' ,'image' ,'institution', 'scholarships' ,'educationLevels' ,'defaultCurrency', 'university_likes', 'uni_faqs' ,'program_likes'));
        } else {
            abort(404);
        }

    }

    public function viewAll()
    {
        $title = trans('institution.all_universities');
        $image = 'univ.jpg';
        $university_likes = universityLikes();
        $countries = getCountry()->get();
        $program_likes = programLikes();
        $institutions = Institution::active()->has('translation')->orderBy('id','desc');

        if(request()->search)  {
            $institutions->whereHas('translation', function($query) {
                $query->where('title', 'like', '%'.request()->search.'%');
            });
        }

        $institutions = $institutions->paginate(6);

        if(request()->search) {
            $institutions->appends(request()->except(['page','_token']));
        }

        return view('front.university.all-university' ,compact('title', 'image' ,'institutions', 'university_likes' ,'countries' ,'program_likes'));
    }

    public function getUniversity($state, $city_id)
    {
        $title = $state->translation->title ?? '';
        $image = $state->image;
        $count_university = State::withCount('institute')
                            ->where('id', $state->id)
                            ->orderBy('institute_count', 'desc')
                            ->pluck('institute_count')
                            ->first();

        $institutions = Institution::orderBy('id','desc')
                    ->where('state_id', $state->id);
                    // ->paginate(6);
        if($city_id) {
            $institutions->where('city_id', $city_id);
        }

        $institutions = $institutions->paginate(6);

        $countries = getCountry()->get();
        $faq = Faq::all();
        $types = Faq::selectRaw('type')->groupBy('type')->get();
        $university_likes = universityLikes();

        $cities = City::where('state_id', $state->id)->get();

        return view('front.university.university' ,compact('title', 'image' ,'institutions', 'count_university', 'countries', 'university_likes', 'faq', 'types', 'cities', 'state', 'city_id'));
    }

    public function getUniversityByCountry($country, $city_id)
    {
        $title = $country->translation->title ?? '';
        $image = $country->image;
        $description = $country->translation->description ?? '';
        $faq = Faq::all();
        $types = Faq::selectRaw('type')->groupBy('type')->get();

        $count_university = Country::withCount('institute')
                            ->where('id', $country->id)
                            ->orderBy('institute_count', 'desc')
                            ->pluck('institute_count')
                            ->first();

        $institutions = Institution::orderBy('id','desc')
                    ->where('country_id', $country->id);

        if($city_id) {
            $institutions->where('city_id', $city_id);
        }
        $institutions = $institutions->paginate(6);

        $university_likes = universityLikes();
        $cities = City::whereNull('state_id')->where('country_id', $country->id)->get();

        return view('front.university.university' ,compact('title' ,'image', 'faq', 'types', 'institutions', 'description', 'count_university', 'university_likes', 'country', 'cities', 'city_id'));
    }

    public function __call($name, $arguments)
    {
        // TODO: Implement @method \App\Model\Institution store(array $data)
        // TODO: Implement @method \App\Model\Institution update(array $data, int $id)
        // TODO: Implement @method \App\Model\Institution delete(int $id)
    }
}

?>

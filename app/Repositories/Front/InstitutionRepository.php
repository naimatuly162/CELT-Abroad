<?php
namespace App\Repositories\Front;

use App\Contracts\Front\InstitutionContract;
use App\Model\Institution;
use App\Model\InstitutionImage;
use App\Model\InstitutionProgramDeadline;
use App\Model\Session;
use Illuminate\Support\Facades\Storage;
use App\Model\EducationLevel;
use DB;
use App\Model\Country;
use App\Model\State;
use App\Model\City;
use App\Model\InstitutionType;
use File;
use Illuminate\Support\Str;
use Intervention\Image\Facades\Image;

/**
 * @method \App\Model\Institution delete(int $id)
 */
class InstitutionRepository implements InstitutionContract
{

    public function index()
    {
        $title = trans('institution.institutions');
        $image = 'student.jpg';
        $institutions = Institution::where('unirep_id',auth()->user()->id)->orderBy('id','desc');

        if(request()->search) {
            $institutions->whereHas('translation', function($query) {
                $query->where('title', 'like', '%'.request()->search.'%');
            });
        }

        $institutions = $institutions->paginate(6);

        if(request()->search) {
            $institutions->appends(request()->except(['page','_token']));
        }

        return compact('title' ,'image' ,'institutions');
    }

    public function create($data = [])
    {
        $title = trans('institution.institutions');
        $image = 'student.jpg';

        $institutionTypes = InstitutionType::get();
        $sessions = Session::get();
        $states = [];
        $cities = [];
        $countryQuery = Country::query();
        $countries = $countryQuery->get();

        $states = State::whereIn('country_id', $countryQuery->pluck('id'))->get();
        $cities = City::whereIn('country_id', $countryQuery->pluck('id'));
//        if($data['state_id']) {
//            $cities->where('state_id', $data['state_id']);
//        }
        $cities = $cities->get();


        return compact('title' ,'image' ,'institutionTypes' ,'countries', 'states', 'cities','sessions');
    }
    /**
     * store new state in database
     *
     * @param array $data
     *
     * @return \App\Models\State
     */
    public function store(array $data)
    {
        // dd($data);
        try{
            // DB::beginTransaction();


            $slug = $this->institutionSlug(Str::slug($data['title']));
            $institution = new Institution;
            if(isset($data['cover_photo'])){
                $file = $data['cover_photo'];
                $name = rand(100000,999999).'.'.$file->getClientOriginalExtension();
                $file->move(Storage::disk('public')->path('institutions/cover'), $name);
                $institution->cover_photo = $name;
            }
            if(isset($data['mini_cover'])){

                $file = $data['mini_cover'];
                $name = rand(100000,999999).'.'.$file->getClientOriginalExtension();
                $file->move(Storage::disk('public')->path('institutions/cover'), $name);

                $image = Image::make(Storage::disk('public')->path('institutions/cover/'.$name))->resize(285,100);

                $image->save();

                $institution->mini_cover = $name;
            }
            if(isset($data['logo'])){
                $file = $data['logo'];
                $logo_name = rand(100000,999999).'.'.$file->getClientOriginalExtension();
                $file->move(Storage::disk('public')->path('institutions/cover'), $logo_name);
//                $image = Image::make(Storage::disk('public')->path('institutions/cover/'.$logo_name))->resize(268,94);
//                $image->save();
                $institution->logo = $logo_name;
            }

            if($data['title'] != '')
            {
               $datas  = [];
               $datas['en']['title'] =$data['title'];
               $datas['en']['description'] =$data['description'];
            }

            $institution->slug = $slug;
            $institution->type_id = $data['type_id'];
            $institution->country_id = $data['country_id'];
            if(isset($data['state_id'])){
                $institution->state_id = $data['state_id'];
            }

            $institution->city_id = $data['city_id'];
            $institution->qs_ranking = $data['qs_ranking'];
            $institution->faculty = $data['faculty'];
            $institution->national_ranking = $data['national_ranking'];
            $institution->global_ranking = $data['global_ranking'];
            $institution->youtube_url = (isset($data['youtube_url']))?getYoutubeEmbedUrl($data['youtube_url']):null;
            $institution->unirep_id = auth()->user()->id;

            $institution->fill($datas);
            $institution->save();

            if (isset($data['image_name']) && $data['image_name'] != '') {
               $images = array_map('trim',array_filter(explode(',',$data['image_name'])));
                foreach ($images as $key => $value) {
                    InstitutionImage::create([
                        'institution_id' => $institution->id,
                        'image_name' => $value,
                    ]);
                }
            }
            return $institution;

        }catch (\Exception $e) {
            // DB::rollBack();
            throw $e;
        }
    }

    public function view($institution)
    {
        $institution = Institution::where('slug',$institution)->first();
        if (!empty($institution)) {
            $title = $institution->title;
            $image = 'univ.jpg';
            $educationLevels = EducationLevel::all();
            $defaultCurrency = defaultCurrency();

            $scholarships = [];
            if (count($institution->programs) > 0) {
                foreach ($institution->programs as $key => $value) {
                    if($value['scholarship'] != 0 && $value['scholarship'] != '')
                    {
                        $scholarships[] = $value;
                    }
                }
            }

            return  view('front.institution.view',compact('title' ,'image' ,'institution', 'scholarships' ,'educationLevels' ,'defaultCurrency'));
        } else {
            return abort(404);
        }
    }

    public function edit($institution)
    {
        $institution = Institution::where('slug',$institution)->first();

        if(!empty($institution)){
            $title = trans('institution.edit').' '.trans('institution.institutions');
            $image = 'student.jpg';
            $countries = Country::get();
            $institutionTypes = InstitutionType::get();
            $country_id = old('country_id') ? old('country_id') : $institution->country_id;
            $states = State::where('country_id', (int)$country_id)->get();
            $cities = City::where('country_id', (int)$country_id);

            if(count($states)) {
                $state_id = old('state_id') ? old('state_id') : $institution->state_id;
                $cities->where('state_id', (int)$state_id);
            }
            $cities = $cities->get();

            return view('front.institution.edit',compact('title' ,'image' ,'institutionTypes' ,'countries' ,'institution' ,'states' ,'cities'));
        } else {
            return abort(404);
        }

    }

    public function update(array $data, $institution)
    {

        try{

            // DB::beginTransaction();
           $institution = Institution::where('slug',$institution)->first();

            if(isset($data['cover_photo'])){
                $file = $data['cover_photo'];
                $name = rand(100000,999999).'.'.$file->getClientOriginalExtension();
                $file->move(Storage::disk('public')->path('institutions/cover'), $name);
                $institution->cover_photo = $name;
            }
            if(isset($data['mini_cover'])){

                $file = $data['mini_cover'];
                $name = rand(100000,999999).'.'.$file->getClientOriginalExtension();
                $file->move(Storage::disk('public')->path('institutions/cover'), $name);

                $image = Image::make(Storage::disk('public')->path('institutions/cover/'.$name))->resize(285,100);

                $image->save();

                $institution->mini_cover = $name;
            }

            if(isset($data['logo'])){

                if(!Storage::disk('public')->exists('institutions/cover'))
                {
                    Storage::disk('public')->makeDirectory('institutions/cover');
                }

                if(Storage::disk('public')->exists('institutions/cover/'.$institution->logo))
                {
                    Storage::disk('public')->delete('institutions/cover/'.$institution->logo);
                }

                $file = $data['logo'];
                $logo_name = rand(100000,999999).'.'.$file->getClientOriginalExtension();
                $file->move(Storage::disk('public')->path('institutions/cover'), $logo_name);
//                $image = Image::make(Storage::disk('public')->path('institutions/cover/'.$logo_name))->resize(268,94);
//                $image->save();
                $institution->logo = $logo_name;
            }


            $institution->type_id = $data['type_id'];
            $institution->country_id = $data['country_id'];
            $institution->state_id = $data['state_id'];
            $institution->city_id = $data['city_id'];
            $institution->qs_ranking = $data['qs_ranking'];
            $institution->faculty = $data['faculty'];
            $institution->national_ranking = $data['national_ranking'];
            $institution->global_ranking = $data['global_ranking'];
            $institution->youtube_url = getYoutubeEmbedUrl($data['youtube_url']);

            if($data['title'] != '')
            {
               $datas  = [];
               $datas['en']['title'] =$data['title'];
               $datas['en']['description'] =$data['description'];
            }
            $institution->fill($datas);
            $institution->save();

            if (isset($data['image_name']) && $data['image_name'] != '') {

                InstitutionImage::where('institution_id',$institution->id)->delete();

                $images = array_map('trim',array_filter(explode(',',$data['image_name'])));
                foreach ($images as $key => $value) {
                    InstitutionImage::create([
                        'institution_id' => $institution->id,
                        'image_name' => $value,
                    ]);
                }
            }
            return $institution;

        }catch (\Exception $e) {
            // DB::rollBack();
            throw $e;
        }
    }

    public function institutionSlug($slug, $i = 0)
    {
        $count = Institution::where('slug',$slug)->count();

        if($count == 0)
            return $slug;

        return $this->institutionSlug($slug.rand(1, 99));
    }

    public function viewImage(int $id)
    {
        $images = InstitutionImage::where('institution_id',$id)->get();

        $filePath = [];
        if(!empty($images)){
            foreach ($images as $key => $value) {
                $file_path = public_path('storage/institutions/',$value->image_name);
                $size =  File::size($file_path);
                $filePath[] = array('name'=>$value->image_name,'size'=> $size,'path'=>asset('storage/institutions/'.$value->image_name));
            }
        }

        return response()->json(['success' => true ,'data' => $filePath ]);
    }

    public function __call($name, $arguments)
    {
        // TODO: Implement @method \App\Model\Institution delete(int $id)
    }
}

?>

<?php
namespace App\Repositories\Front;

use App\Contracts\Front\UniversitySettingContract;
use App\Model\Country;
use App\Model\State;
use App\Model\City;
use App\Model\UniversityRepresentative;
use Intervention\Image\Facades\Image;

class UniversitySettingRepository implements UniversitySettingContract
{
    public function get()
    {
        $title = 'Profile Setting';
        $unirep = \Auth::user();
        if($unirep->image)
            $image = $unirep->image;
        else
            $image = 'univ.jpg';
        $countries = Country::get();
        $country_id = old('country_id') ? old('country_id') : auth()->user()->country_id;
        $states = State::where('country_id', (int)$country_id)->get();
        $cities = City::where('country_id', (int)$country_id);
        if(count($states)) {
            $state_id = old('state_id') ? old('state_id') : auth()->user()->state_id;
            $cities->where('state_id', (int)$state_id);
        }
        $cities = $cities->get();

        return compact('title' ,'image' ,'countries', 'states', 'cities' ,'unirep');
    }

    public function save(array $data)
    {
    	$unirep = UniversityRepresentative::find(auth()->user()->id);
    	$unirep->first_name   =   $data['first_name'];
        $unirep->last_name    =   $data['last_name'];
        $unirep->email        =   $data['email'];
        $unirep->phone        =   $data['phone'];
        $unirep->address      =   $data['address'];
        $unirep->country_id   =   $data['country_id'];
        $unirep->state_id     =   $data['state_id'];
        $unirep->city_id      =   $data['city_id'];
        $unirep->zipcode      =   $data['zipcode'];
        $unirep->title      =   $data['title'];

        if (isset($data['image'])) {
            $unirep_image  =   $this->uploadImage($data['image'], 'unirep');
            $unirep->image    =   $unirep_image;
        }

        $unirep->save();

        return $unirep;
    }

    public function deleteAccount(array $data)
    {
        $unirep = auth()->user()->delete();

        return response()->json(['success' => true , 'message' => 'University representative account deleted successfully.']);
    }
    private function uploadImage($file, $dir, $resize_width = 100, $resize_height = 100)
    {
        if ($file) {
            $uploadDir = 'storage' . DIRECTORY_SEPARATOR . $dir . DIRECTORY_SEPARATOR;
            $destinationPath = public_path($uploadDir);
            $media_image = $file->hashName();
            $newPhotoName = time() . '_' . $media_image;
            $img = Image::make($file->path());

            $img->resize($resize_width, $resize_height, function ($constraint) {
                $constraint->aspectRatio();
            });
            $file->move($destinationPath, $newPhotoName);
            return $uploadDir.$newPhotoName;
        }
    }

}

?>
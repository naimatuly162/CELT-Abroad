<?php namespace App\Repositories;

use App\Contracts\CountryLivingContract;
use App\Model\Country;
use App\Model\CountryLivingTranslation;
use Illuminate\Database\Eloquent\Model;
use App\Model\CountryVisaTranslation;
use Illuminate\Support\Facades\Storage;

/**
 * @method \App\Model\Country store(array $data)
 */
class CountryLivingRepository implements CountryLivingContract
{
    // model property on class instances
    protected $model;

    // Constructor to bind model to repo
    public function __construct(Model $model)
    {
        $this->model = $model;
    }

    // update record in the database
    public function update(array $data, $id)
    {
        $country = Country::find($id);

        foreach ($data['description'] as $key => $value) {
            $datas[$key]['country_id'] = $id;
            $datas[$key]['locale'] = $key;
            $datas[$key]['description'] = $value['description'] ?? NULL;
        }
        foreach ($data['accommodation'] as $key => $value) {
            $datas[$key]['accommodation'] = $value['accommodation'] ?? NULL;
        }
        foreach ($data['transport'] as $key => $value) {
            $datas[$key]['transport'] = $value['transport'] ?? NULL;
        }
        foreach ($data['food'] as $key => $value) {
            $datas[$key]['food'] = $value['food'] ?? NULL;
        }
        foreach ($data['miscellaneous'] as $key => $value) {
            $datas[$key]['miscellaneous'] = $value['miscellaneous'] ?? NULL;
        }
        foreach ($data['utility'] as $key => $value) {
            $datas[$key]['utility'] = $value['utility'] ?? NULL;
        }
        $country_living=CountryLivingTranslation::where('country_id',$id)->get();
        if ($country_living->count() >0){
            foreach ($datas as $key=>$data){
                CountryLivingTranslation::where([['country_id',$id],['locale',$data['locale']]])->update($data);
            }
        }else{
            foreach ($datas as $key=>$data){
                CountryLivingTranslation::create($data);
            }
        }
        return $country;
    }

    public function show($id)
    {
        return CountryLivingTranslation::where('country_id',$id)->get();
    }

    // remove record from the database
    public function delete($id)
    {
        CountryTranslation::where('country_id', $id)->delete();
        $states = State::where('country_id', $id)->get();
        if (count($states) > 0) {
            foreach ($states as $state) {
                StateTranslation::where('state_id', $state->id)->delete();
                $state->delete();
            }
        }

        $cities = City::where('country_id', $id)->get();

        if (count($cities) > 0) {
            foreach ($cities as $city) {
                CityTranslation::where('city_id', $city->id)->delete();
                $city->delete();
            }
        }

        return $this->model->destroy($id);
    }


    public static function checkDirectory($dir)
    {
        if (!Storage::disk('public')->exists($dir)) {
            Storage::disk('public')->makeDirectory($dir);
        }
    }


    public function __call($name, $arguments)
    {
        // TODO: Implement @method \App\Model\Country store(array $data)
    }
}

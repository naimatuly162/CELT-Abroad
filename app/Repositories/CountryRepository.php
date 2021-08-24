<?php namespace App\Repositories;

use App\Contracts\CountryContract;
use App\Model\Country;
use Illuminate\Database\Eloquent\Model;
use App\Model\CountryTranslation;
use App\Model\State;
use App\Model\StateTranslation;
use App\Model\City;
use App\Model\CityTranslation;
use Illuminate\Support\Facades\Storage;

/**
 * @method \App\Model\Country store(array $data)
 */
class CountryRepository implements CountryContract
{
    // model property on class instances
    protected $model;

    // Constructor to bind model to repo
    public function __construct(Model $model)
    {
        $this->model = $model;
    }

    // Get all instances of model
    public function all()
    {
        return $this->model->all();
    }

    // create a new record in the database
    public function create(array $data)
    {
        $country = new Country;

        foreach ($data as $key => $value) {
            $datas[$key] = $value;
        }
        foreach ($data['study_process'] as $key => $value) {
            $datas[$key]['study_process'] = $value['key_process'] ?? NULL;
        }
        foreach ($data['study_process_2'] as $key => $value) {
            $datas[$key]['study_process_2'] = $value['key_process_2'] ?? NULL;
        }
        foreach ($data['study_process_3'] as $key => $value) {
            $datas[$key]['study_process_3'] = $value['key_process_3'] ?? NULL;
        }
        if (isset($data['image'])) {
            $file = $data['image'];
            $logo_name = rand(100000, 999999) . '.' . $file->getClientOriginalExtension();
            self::checkDirectory('country');
            $file->move(Storage::disk('public')->path('country'), $logo_name);
            $datas['image'] = $logo_name;


        }


        $country->fill($datas)->save();
        return $country;
    }

    // update record in the database
    public function update(array $data, $id)
    {
        $country = Country::find($id);

        foreach ($data as $key => $value) {
            $datas[$key] = $value;
        }
        foreach ($data['study_process'] as $key => $value) {
            $datas[$key]['study_process'] = $value['key_process'] ?? NULL;
        }
        foreach ($data['study_process_2'] as $key => $value) {
            $datas[$key]['study_process_2'] = $value['key_process_2'] ?? NULL;
        }
        foreach ($data['study_process_3'] as $key => $value) {
            $datas[$key]['study_process_3'] = $value['key_process_3'] ?? NULL;
        }

        if (isset($data['image'])) {
            $file = $data['image'];
            $logo_name = rand(100000, 999999) . '.' . $file->getClientOriginalExtension();
            self::checkDirectory('country');
            $file->move(Storage::disk('public')->path('country'), $logo_name);
            $country_image = Storage::disk('public')->path('country') . $logo_name;
            $datas['image'] = $logo_name;


        }


        $country->fill($datas)->save();
        return $country;
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

    // show the record with the given id
    public function show($id)
    {
        return $this->model->find($id);
    }

    public function find($id)
    {
        return $this->model->find($id);
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

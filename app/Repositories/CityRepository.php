<?php
namespace App\Repositories;

use App\Contracts\CityContract;
use App\Model\City;
use App\Model\CityTranslation;

class CityRepository implements CityContract
{
    /**
     * store new city in database
     *
     * @param array $data
     *
     * @return \App\Models\City
     */
    public function save(array $data)
    {
        $city =  new City;

        $city->country_id = $data['country_id'];
        $city->state_id = $data['state_id'];

        if (isset($data['image'])) {
            $city_image     =   uploadFile($data['image'], 'city');
            $city->image    =   $city_image;
        }

        foreach ($data['city'] as $key => $value) {
            if($value['title'] != NULL)
            {
                $d['title'] = $value['title'];
                $d['description'] = $value['description'] ?? NULL;
                $datas[$key] = $d;
            }
        }

        $city->fill($datas)->save();
        return $city;
    }

    /**
     * update city in database
     *
     * @param array $data
     * @param int $id
     *
     * @return \App\Models\City
     */
    public function update(array $data, int $id)
    {
        $city =  City::find($id);

        $city->country_id = $data['country_id'];
        $city->state_id = $data['state_id'];

        if (isset($data['image'])) {
            $city_image     =   uploadFile($data['image'], 'city');
            $city->image    =   $city_image;
        }

        foreach ($data['city'] as $key => $value) {
            if($value['title'] != NULL)
            {
                $d['title'] = $value['title'];
                $d['description'] = $value['description'] ?? NULL;
                $datas[$key] = $d;
            }
        }
        $city->fill($datas)->save();
        return $city;
    }

    /**
     * delete city from database
     *
     * @param int $id
     *
     * @return boolean
     */
    public function delete(int $id)
    {
        CityTranslation::where('city_id', $id)->delete();

        return City::where('id', $id)->delete();
    }

    public function getCity($state_id, $country_id)
    {
        $cities = City::where('country_id', $country_id);

        if($state_id) {
            $cities->where('state_id', $state_id);
        }

        return $cities->get();
    }

}

?>

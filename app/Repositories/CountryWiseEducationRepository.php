<?php
namespace App\Repositories;

use App\Contracts\CountryWiseEducationContract;
use App\Model\CountryWiseEducation;

class CountryWiseEducationRepository implements CountryWiseEducationContract
{
    /**
     * store new state in database
     *
     * @param array $data
     *
     * @return \App\Models\State
     */
    public function save(array $data)
    {
        if(count($data['degrees']) > 0){
            foreach ($data['degrees'] as $degree){
                $fill_data=[
                    'residential_country_id'=>$data['residential_country_id'],
                    'destination_country_id'=>$data['destination_country_id'],
                    'residential_degree_id'=>$data['residential_degree_id'],
                    'destination_degree_id'=>$degree,
                ];
                $country_wise_education =  new CountryWiseEducation;
                $country_wise_education->fill($fill_data)->save();
            }
        }
        return true;
    }

    /**
     * update state in database
     *
     * @param array $data
     * @param int $id
     *
     * @return \App\Models\State
     */
    public function update(array $data, int $id)
    {
       /* $foundation_route =  FoundationRoute::find($id);
        $foundation_route->fill($data)->save();
        return $foundation_route;*/
    }

    /**
     * delete state from database
     *
     * @param int $id
     *
     * @return boolean
     */
    public function delete(int $id)
    {
        $countrywise_education = CountryWiseEducation::find($id);
        $countrywise_education->delete();

        return response()->json(['success' => true]);
    }

}

?>
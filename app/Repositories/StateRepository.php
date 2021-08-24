<?php
namespace App\Repositories;

use App\Contracts\StateContract;
use App\Model\State;
use App\Model\StateTranslation;
use App\Model\City;
use App\Model\CityTranslation;

class StateRepository implements StateContract
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
        $state =  new State;

        $state->country_id = $data['country_id'];
        if (isset($data['image'])) {
            $state_image     =   uploadFile($data['image'], 'state');
            $state->image    =   $state_image;
        }

        foreach ($data['state'] as $key => $value) {
            if($value['title'] != NULL)
            {
                $d['title'] = $value['title'];
                $d['description'] = $value['description'] ?? NULL;
                $datas[$key] = $d;
            }
        }
        $state->fill($datas)->save();
        return $state;
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
        $state =  State::find($id);

        $state->country_id = $data['country_id'];
        if (isset($data['image'])) {
            $state_image     =   uploadFile($data['image'], 'state');
            $state->image    =   $state_image;
        }

        foreach ($data['state'] as $key => $value) {
            if($value['title'] != NULL)
            {
                $d['title'] = $value['title'];
                $d['description'] = $value['description'] ?? NULL;
                $datas[$key] = $d;
            }
        }
        $state->fill($datas)->save();
        return $state;
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
        StateTranslation::where('state_id', $id)->delete();
        $cities = City::where('country_id', $id)->get();

        if(count($cities) > 0) {
            foreach($cities as $state) {
                CityTranslation::where('state_id', $state->id)->delete();
                $state->delete();
            }
        }
        return State::where('id', $id)->delete();
    }

    public function getState($country_id)
    {
        return State::where('country_id', $country_id)->get();
    }

}

?>
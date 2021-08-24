<?php
namespace App\Repositories;

use App\Contracts\PrefilledDateContract;
use App\Model\PrefilledDate;

class PrefilledDateRepository implements PrefilledDateContract
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
        $prefilledDate =  new PrefilledDate;
        if($data['type'] == 1)
        {
            $period = date('m', strtotime($data['period']));
        }else{
            $period = date('d-m', strtotime($data['period']));
        }
        $prefilledDate->period = $period;
        $prefilledDate->type = $data['type'];
        $prefilledDate->save();
        return $prefilledDate;
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
        $prefilledDate =  PrefilledDate::find($id);
        if ($data['type'] == 1) {
            $period = date('m', strtotime($data['period']));
        } else {
            $period = $data['period'];
        }
        $prefilledDate->period = $period;
        $prefilledDate->type = $data['type'];
        $prefilledDate->update();

        return $prefilledDate;
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
        return PrefilledDate::where('id', $id)->delete();
    }

}

?>
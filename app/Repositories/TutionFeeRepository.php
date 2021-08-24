<?php
namespace App\Repositories;

use App\Contracts\TutionFeeContract;
use App\Model\TutionFee;

class TutionFeeRepository implements TutionFeeContract
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
        foreach ($data as $key => $value) {
            if($value['title'] != NULL)
            {
                $datas[$key] = $value;
            }
        }
        $tutionFee =  new TutionFee;
        $tutionFee->fill($datas)->save();
        return $tutionFee;
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
        foreach ($data as $key => $value) {
            if($value['title'] != NULL)
            {
                $datas[$key] = $value;
            }
        }
        $tutionFee =  TutionFee::find($id);
        $tutionFee->fill($datas)->save();
        return $tutionFee;
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
        $tutionFee = TutionFee::find($id);
        $tutionFee->translations()->delete();
        $tutionFee->delete();

        return response()->json(['success' => true]);
    }

}

?>
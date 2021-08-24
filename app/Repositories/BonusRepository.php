<?php
namespace App\Repositories;

use App\Contracts\BonusContract;
use App\Model\Bonus;

class BonusRepository implements BonusContract
{
    /**
     * store new Bonus in database
     * 
     * @param array $data
     * 
     * @return \App\Models\Bonus
     */
    public function save(array $data)
    {
        foreach ($data as $key => $value) {
            if($value['title'] != NULL)
            {
                $datas[$key] = $value;
            }
        }
        $bonus =  new Bonus;
        $bonus->fill($datas)->save();
        return $bonus;
    }

    /**
     * update Bonus in database
     * 
     * @param array $data
     * @param int $id
     * 
     * @return \App\Models\Bonus
     */
    public function update(array $data, int $id)
    {
        foreach ($data as $key => $value) {
            if($value['title'] != NULL)
            {
                $datas[$key] = $value;
            }
        }
        $bonus =  Bonus::find($id);
        $bonus->fill($datas)->save();
        return $bonus;
    }
    
    /**
     * delete Bonus from database
     * 
     * @param int $id
     * 
     * @return boolean
     */
    public function delete(int $id)
    {
        $bonus = Bonus::where('id',$id)->first();
        $bonus->translations()->delete();
        $bonus->delete();
        return response()->json(['success'=> true]); 
    }

}

?>
<?php
namespace App\Repositories;

use App\Contracts\StudyTypeContract;
use App\Model\StudyType;

class StudyTypeRepository implements StudyTypeContract
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
        $studyType =  new StudyType;
        $studyType->fill($datas)->save();
        return $studyType;
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
        $studyType =  StudyType::find($id);
        $studyType->fill($datas)->save();
        return $studyType;
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
        $studyType = StudyType::find($id);
        $studyType->translations()->delete();
        $studyType->delete();

        return response()->json(['success' => true]);
    }

}

?>
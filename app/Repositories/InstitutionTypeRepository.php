<?php
namespace App\Repositories;

use App\Contracts\InstitutionTypeContract;
use App\Model\InstitutionType;
use App\Model\InstitutionTypeTranslation;

class InstitutionTypeRepository implements InstitutionTypeContract
{
    /**
     * store new InstitutionType in database
     * 
     * @param array $data
     * 
     * @return \App\Models\InstitutionType
     */
    public function save(array $data)
    {
        foreach ($data as $key => $value) {
            if($value['title'] != NULL)
            {
                $d['title'] = $value['title'];
                $d['description'] = $value['description'] ?? NULL;
                $datas[$key] = $d;
            }
        }
        $institutionType =  new InstitutionType;
        $institutionType->fill($datas)->save();
        return $institutionType;
    }

    /**
     * update InstitutionType in database
     * 
     * @param array $data
     * @param int $id
     * 
     * @return \App\Models\InstitutionType
     */
    public function update(array $data, int $id)
    {
        foreach ($data as $key => $value) {
            if($value['title'] != NULL)
            {
                $d['title'] = $value['title'];
                $d['description'] = $value['description'] ?? NULL;
                $datas[$key] = $d;
            }
        }
        $institutionType =  InstitutionType::find($id);
        $institutionType->fill($datas)->save();
        return $institutionType;
    }
    
    /**
     * delete InstitutionType from database
     * 
     * @param int $id
     * 
     * @return boolean
     */
    public function delete(int $id)
    {
        $institutionType = InstitutionType::find($id);
        $institutionType->translations()->delete();
        $institutionType->delete();

        return response()->json(['success' => true]);
    }

}

?>
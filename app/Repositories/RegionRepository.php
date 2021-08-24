<?php
namespace App\Repositories;

use App\Contracts\RegionContract;
use App\Model\Region;
use App\Model\Session;

/**
 * @method \App\Model\Session store(array $data)
 */
class RegionRepository implements RegionContract
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

        $region =  new Region();
        $region->fill($datas)->save();
        return $region;
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
        $region =  Region::find($id);
        $region->fill($datas)->save();
        return $region;
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
        $region = Region::find($id);
        $region->translations()->delete();
        $region->delete();

        return response()->json(['success' => true]);
    }

    public function __call($name, $arguments)
    {
        // TODO: Implement @method \App\Model\Session store(array $data)
    }
}

?>

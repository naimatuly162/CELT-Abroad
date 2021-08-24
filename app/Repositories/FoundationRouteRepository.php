<?php
namespace App\Repositories;

use App\Contracts\FoundationRouteContract;
use App\Model\FoundationRoute;

class FoundationRouteRepository implements FoundationRouteContract
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
        $foundation_route =  new FoundationRoute;
        $foundation_route->fill($data)->save();
        return $foundation_route;
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
        $foundation_route =  FoundationRoute::find($id);
        $foundation_route->fill($data)->save();
        return $foundation_route;
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
        $foundation_route = FoundationRoute::find($id);
        //$foundation_route->translations()->delete();
        $foundation_route->delete();

        return response()->json(['success' => true]);
    }

}

?>
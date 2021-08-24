<?php
namespace App\Repositories;

use App\Contracts\SessionContract;
use App\Model\Session;

/**
 * @method \App\Model\Session store(array $data)
 */
class SessionRepository implements SessionContract
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
            if($value['session_name'] != NULL)
            {
                $datas[$key] = $value;
            }
        }
        $session =  new Session;
        $session->fill($datas)->save();
        return $session;
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
            if($value['session_name'] != NULL)
            {
                $datas[$key] = $value;
            }
        }
        $session =  Session::find($id);
        $session->fill($datas)->save();
        return $session;
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
        $session = Session::find($id);
        $session->translations()->delete();
        $session->delete();

        return response()->json(['success' => true]);
    }

    public function __call($name, $arguments)
    {
        // TODO: Implement @method \App\Model\Session store(array $data)
    }
}

?>

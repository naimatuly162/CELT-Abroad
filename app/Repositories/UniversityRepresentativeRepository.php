<?php
namespace App\Repositories;

use App\Contracts\UniversityRepresentativeContract;
use App\Model\UniversityRepresentative;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendUniversityRegisterMail;

class UniversityRepresentativeRepository implements UniversityRepresentativeContract
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
        $password = Str::random(8);
        $data['password'] = bcrypt($password);
        $university = UniversityRepresentative::create($data);
        Mail::to($university->email)->send(new SendUniversityRegisterMail($university, $password));
        return $university;
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
        return UniversityRepresentative::where('id',$id)->update($data);
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
        return UniversityRepresentative::where('id',$id)->delete();
    }

}

?>

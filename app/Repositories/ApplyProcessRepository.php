<?php namespace App\Repositories;

use App\Contracts\ApplyProcessContract;
use App\Model\ApplyProcessTranslation;
use App\Model\Country;
use Illuminate\Database\Eloquent\Model;
use App\Model\CountryVisaTranslation;
use Illuminate\Support\Facades\Storage;

/**
 * @method \App\Model\Country store(array $data)
 */
class ApplyProcessRepository implements ApplyProcessContract
{
    // model property on class instances
    protected $model;

    // Constructor to bind model to repo
    public function __construct(Model $model)
    {
        $this->model = $model;
    }

    // update record in the database
    public function update(array $data, $id)
    {
        $country = Country::find($id);
        foreach ($data['application_process'] as $key => $value) {
            $datas[$key]['country_id'] = $id;
            $datas[$key]['locale'] = $key;
            $datas[$key]['application_process'] = $value['application_process'] ?? NULL;
        }
        $country_visa=ApplyProcessTranslation::where('country_id',$id)->get();
        if ($country_visa->count() >0){
            foreach ($datas as $key=>$data){

                ApplyProcessTranslation::where([['country_id',$id],['locale',$data['locale']]])->update($data);
            }
        }else{
            foreach ($datas as $key=>$data){
                ApplyProcessTranslation::create($data);
            }
        }
        return $country;
    }

    public function show($id)
    {
        return ApplyProcessTranslation::where('country_id',$id)->get();
    }

    // remove record from the database
    public function delete($id)
    {

    }


    public static function checkDirectory($dir)
    {
        if (!Storage::disk('public')->exists($dir)) {
            Storage::disk('public')->makeDirectory($dir);
        }
    }


    public function __call($name, $arguments)
    {
        // TODO: Implement @method \App\Model\Country store(array $data)
    }
}

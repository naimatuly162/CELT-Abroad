<?php namespace App\Repositories;

use App\Contracts\CountryVisaContract;
use App\Model\Country;
use Illuminate\Database\Eloquent\Model;
use App\Model\CountryVisaTranslation;
use Illuminate\Support\Facades\Storage;

/**
 * @method \App\Model\Country store(array $data)
 */
class CountryVisaRepository implements CountryVisaContract
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

        foreach ($data['description'] as $key => $value) {
            $datas[$key]['country_id'] = $id;
            $datas[$key]['locale'] = $key;
            $datas[$key]['description'] = $value['description'] ?? NULL;
        }
        foreach ($data['visa_type'] as $key => $value) {
            $datas[$key]['visa_type'] = $value['visa_type'] ?? NULL;
        }
        foreach ($data['requirement'] as $key => $value) {
            $datas[$key]['requirement'] = $value['requirement'] ?? NULL;
        }
        foreach ($data['fees'] as $key => $value) {
            $datas[$key]['fees'] = $value['fees'] ?? NULL;
        }
        foreach ($data['work_permit'] as $key => $value) {
            $datas[$key]['work_permit'] = $value['work_permit'] ?? NULL;
        }
        $country_visa=CountryVisaTranslation::where('country_id',$id)->get();
        if ($country_visa->count() >0){
            foreach ($datas as $key=>$data){
                CountryVisaTranslation::where([['country_id',$id],['locale',$data['locale']]])->update($data);
            }
        }else{
            foreach ($datas as $key=>$data){
                CountryVisaTranslation::create($data);
            }
        }
        return $country;
    }

    public function show($id)
    {
        return CountryVisaTranslation::where('country_id',$id)->get();
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

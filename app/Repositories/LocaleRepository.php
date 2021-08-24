<?php
namespace App\Repositories;

use App\Contracts\LocaleContract;
use App\Model\Locale;

class LocaleRepository implements LocaleContract
{
    /**
     * store new city in database
     * 
     * @param array $data
     * 
     * @return \App\Models\City
     */
    public function save(array $data)
    {
        if(Locale::where('is_default',1)->count()){
            return Locale::create($data);   
        } else {
            return Locale::create(array_merge($data,array('is_default'=>1)));
        }

    }

    /**
     * update city in database
     * 
     * @param array $data
     * @param string $locale
     * 
     * @return \App\Models\City
     */
    public function update(array $data, string $locale)
    {
        return Locale::where('locale', $locale)->update($data);
    }
    
    /**
     * delete city from database
     * 
     * @param string $locale
     * 
     * @return boolean
     */
    public function delete(string $locale)
    {
        $data = Locale::where('locale', $locale)->first();
        if($data->is_default == 1) {
            return false ;
        } else {
            return Locale::where('locale', $locale)->delete();
        }
        
    }

}

?>
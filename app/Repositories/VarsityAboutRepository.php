<?php namespace App\Repositories;

use App\Contracts\VarsityAboutContract;
use App\Model\ApplyProcessTranslation;
use App\Model\Country;
use App\Model\Institution;
use App\Model\VarsityAboutTranslation;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

/**
 * @method \App\Model\Country store(array $data)
 */
class VarsityAboutRepository implements VarsityAboutContract
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
        $youtube_url=$data['video_url'];
        $institution = Institution::find($id);
        foreach ($data['description'] as $key => $value) {
            $datas[$key]['institution_id'] = $id;
            $datas[$key]['locale'] = $key;
            $datas[$key]['description'] = $value['description'] ?? NULL;
        }
        $institution_data=VarsityAboutTranslation::where('institution_id',$id)->get();
        if ($institution_data->count() >0){
            foreach ($datas as $key=>$data){
                VarsityAboutTranslation::where([['institution_id',$id],['locale',$data['locale']]])->update($data);
            }
            if($institution->about_youtube_url ==null){
                $institution->about_youtube_url = getYoutubeEmbedUrl($youtube_url);
                $institution->save();
            }

        }else{
            foreach ($datas as $key=>$data){
                VarsityAboutTranslation::create($data);
            }
            $institution->about_youtube_url = getYoutubeEmbedUrl($youtube_url);
            $institution->save();
        }
        return $institution;
    }

    public function show($id)
    {
        return VarsityAboutTranslation::where('institution_id',$id)->get();
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

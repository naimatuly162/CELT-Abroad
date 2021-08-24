<?php namespace App\Repositories;

use App\Contracts\DisciplineContract;
use App\Model\Discipline;
use App\Model\DisciplineTranslation;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

/**
 * @method \App\Model\Country store(array $data)
 */
class DisciplineRepository implements DisciplineContract
{
    // model property on class instances
    protected $model;

    // Constructor to bind model to repo
    public function __construct(Model $model)
    {
        $this->model = $model;
    }

    // Get all instances of model
    public function all()
    {
        return $this->model->all();
    }

    // create a new record in the database
    public function create(array $data)
    {

        $discipline = new Discipline;
        foreach ($data as $key => $value) {
            $datas[$key] = $value;
        }

        if (isset($data['cover_photo'])) {
            $file = $data['cover_photo'];
            $cover_photo_name = rand(100000, 999999) . '.' . $file->getClientOriginalExtension();
            $file->move(Storage::disk('public')->path('discipline'), $cover_photo_name);
            $image = Image::make(Storage::disk('public')->path('discipline/'.$cover_photo_name));
            $image->save();
            $datas['cover_photo'] = $cover_photo_name;
        }
        if (isset($data['thumbnails'])) {
            $file = $data['thumbnails'];
            $thumbnails_name = rand(100000,999999).'.'.$file->getClientOriginalExtension();
            $file->move(Storage::disk('public')->path('discipline'), $thumbnails_name);
            $image = Image::make(Storage::disk('public')->path('discipline/'.$thumbnails_name))->resize(182,182);
            $image->save();
            $datas['thumbnails'] = $thumbnails_name;

        }
        if (isset($data['logo'])) {
            $file = $data['logo'];
            $logo_name = rand(100000, 999999) . '.' . $file->getClientOriginalExtension();
            $file->move(Storage::disk('public')->path('discipline'), $logo_name);
            $image = Image::make(Storage::disk('public')->path('discipline/'.$logo_name))->resize(63,63);
            $image->save();
            $datas['logo'] = $logo_name;
        }

        $discipline->fill($datas)->save();
        return $discipline;
    }

    // update record in the database
    public function update(array $data, $id)
    {
        $discipline = Discipline::find($id);

        foreach ($data as $key => $value) {
            $datas[$key] = $value;
        }

        if (isset($data['cover_photo'])) {
            $file = $data['cover_photo'];
            $cover_photo_name = rand(100000, 999999) . '.' . $file->getClientOriginalExtension();
            self::checkDirectory('discipline');
            $file->move(Storage::disk('public')->path('discipline'), $cover_photo_name);
            $discipline_cover_photo = Storage::disk('public')->path('discipline') . $cover_photo_name;
            $datas['cover_photo'] = $cover_photo_name;
        }

        if (isset($data['thumbnails'])) {
            $file = $data['thumbnails'];
            $thumbnails_name = rand(100000, 999999) . '.' . $file->getClientOriginalExtension();
            $file->move(Storage::disk('public')->path('discipline'), $thumbnails_name);
//            $discipline_thumbnails = Storage::disk('public')->path('discipline') . $thumbnails_name;
            $image = Image::make(Storage::disk('public')->path('discipline/'.$thumbnails_name))->resize(182,182);
            $image->save();
            $datas['thumbnails'] = $thumbnails_name;
        }

        if (isset($data['logo'])) {
            $file = $data['logo'];
            $logo_name = rand(100000, 999999) . '.' . $file->getClientOriginalExtension();
            $file->move(Storage::disk('public')->path('discipline'), $logo_name);
//            $discipline_logo = Storage::disk('public')->path('discipline') . $logo_name;
            $image = Image::make(Storage::disk('public')->path('discipline/'.$logo_name))->resize(63,63);
            $image->save();
            $datas['logo'] = $logo_name;
        }


        $discipline->fill($datas)->save();
        return $discipline;
    }

    // remove record from the database
    public function delete($id)
    {
        DisciplineTranslation::where('discipline_id', $id)->delete();
        return $this->model->destroy($id);
    }

    // show the record with the given id
    public function show($id)
    {
        return $this->model->find($id);
    }

    public function find($id)
    {
        return $this->model->find($id);
    }

    public static function checkDirectory($dir)
    {
        if (!Storage::disk('public')->exists($dir)) {
            Storage::disk('public')->makeDirectory($dir);
        }
    }


    public function __call($name, $arguments)
    {
        // TODO: Implement @method \App\Model\Discipline store(array $data)
    }
}

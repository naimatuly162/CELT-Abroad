<?php
namespace App\Repositories;

use App\Contracts\InstitutionContract;
use App\Model\Institution;
use App\Model\InstitutionImage;
use Exception;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use DB;
use File;
use Illuminate\Support\Str;
use Intervention\Image\Facades\Image;

class InstitutionRepository implements InstitutionContract
{
    /**
     * store new state in database
     *
     * @param array $data
     * @return Institution|Model
     * @throws Exception
     */
    public function save(array $data)
    {
        try {
            DB::beginTransaction();

            if (isset($data['cover_photo'])) {
                $file = $data['cover_photo'];
                $name = rand(100000, 999999) . '.' . $file->getClientOriginalExtension();
                $file->move(Storage::disk('public')->path('institutions/cover'), $name);
                $data['cover_photo'] = $name;
            }
            if (isset($data['logo'])) {
                $file      = $data['logo'];
                $logo_name = rand(100000, 999999) . '.' . $file->getClientOriginalExtension();
                $file->move(Storage::disk('public')->path('institutions/cover'), $logo_name);
                // $image = Image::make(Storage::disk('public')->path('institutions/cover/'.$logo_name))->resize(268,94);
                // $image->save();
                $data['logo'] = $logo_name;
            }

            $institution = Institution::create($data);

            if (!empty($data['image_name'])) {
                foreach ($data['image_name'] as $key => $value) {
                    $file = $value;
                    $name = rand(100000, 999999) . '.' . $file->getClientOriginalExtension();
                    $file->move(Storage::disk('public')->path('institutions'), $name);
                    $image = $name;
                    InstitutionImage::create([
                        'institution_id' => $institution->id,
                        'image_name'     => $image,
                    ]);
                }
            }
            return $institution;

        }
        catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    /**
     * update state in database
     *
     * @param array $data
     * @param int $id
     * @return Institution|Institution[]|Collection|Model|null
     * @throws Exception
     */
    public function update(array $data, int $id)
    {
        try {
            // DB::beginTransaction();
            $institution = Institution::find($id);

            if (isset($data['cover_photo'])) {
                $file = $data['cover_photo'];
                $name = rand(100000, 999999) . '.' . $file->getClientOriginalExtension();
                $file->move(Storage::disk('public')->path('institutions/cover'), $name);

                $image = Image::make(Storage::disk('public')->path('institutions/cover/' . $name))
                    ->resize(1400, 800);
                $image->save();

                $institution->cover_photo = $name;
            }

            if (isset($data['mini_cover'])) {
                $file = $data['mini_cover'];
                $name = rand(100000, 999999) . '.' . $file->getClientOriginalExtension();
                $file->move(Storage::disk('public')->path('institutions/cover'), $name);

                $image = Image::make(Storage::disk('public')->path('institutions/cover/' . $name))
                    ->resize(285, 100);
                $image->save();

                $institution->mini_cover = $name;
            }

            if (isset($data['logo'])) {


                if (!Storage::disk('public')->exists('institutions/cover')) {
                    Storage::disk('public')->makeDirectory('institutions/cover');
                }
                // delete old post image
                if (Storage::disk('public')->exists('institutions/cover/' . $institution->logo)) {
                    Storage::disk('public')->delete('institutions/cover/' . $institution->logo);
                }

                $file      = $data['logo'];
                $logo_name = rand(100000, 999999) . '.' . $file->getClientOriginalExtension();
                $file->move(Storage::disk('public')->path('institutions/cover'), $logo_name);


                // $image = Image::make(Storage::disk('public')->path('institutions/cover/'.$logo_name))->resize(268,94);
                // $image->save();
                $institution->logo = $logo_name;
            }

            foreach ($data['institution'] as $key => $value) {
                if ($value['title'] != NULL) {
                    $d['title']       = $value['title'];
                    $d['description'] = $value['description'] ?? NULL;
                    $datas[$key]      = $d;
                }
            }
            //            dd($institution->fill($datas));
            $institution->fill($datas)->save();
            $institution->type_id          = $data['type_id'];
            $institution->country_id       = $data['country_id'];
            $institution->state_id         = $data['state_id'];
            $institution->city_id          = $data['city_id'];
            $institution->national_ranking = $data['national_ranking'];
            $institution->global_ranking   = $data['global_ranking'];
            $institution->youtube_url      = getYoutubeEmbedUrl($data['youtube_url']);
            $institution->save();

            if (isset($data['image_name']) && $data['image_name'] != '') {

                InstitutionImage::where('institution_id', $id)->delete();

                $images = array_map('trim', array_filter(explode(',', $data['image_name'])));
                foreach ($images as $key => $value) {
                    InstitutionImage::create([
                        'institution_id' => $id,
                        'image_name'     => $value,
                    ]);
                }
            }
            return $institution;

        }
        catch (Exception $e) {
            // DB::rollBack();
            throw $e;
        }
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
        $image = InstitutionImage::where('institution_id', $id)->delete();
        return Institution::where('id', $id)->delete();
    }

    public function institutionSlug($slug, $i = 0)
    {
        $count = Institution::where('slug', $slug)->count();

        if ($count == 0)
            return $slug;

        return $this->institutionSlug($slug . rand(1, 99));
    }

    public function changeFeature(int $id)
    {
        $institution              = Institution::find($id);
        $institution->is_featured = ($institution->is_featured == 0
            ? 1
            : 0);
        $institution->save();

        return response()->json(['success' => true]);
    }

    public function changeActive(int $id)
    {
        $institution            = Institution::find($id);
        $institution->is_active = ($institution->is_active == 0
            ? 1
            : 0);
        $institution->save();

        return response()->json(['success' => true]);
    }

    public function viewImage(int $id)
    {
        $images = InstitutionImage::where('institution_id', $id)->get();

        $filePath = [];
        if (!empty($images)) {
            foreach ($images as $key => $value) {
                $file_path  = public_path('storage/institutions/', $value->image_name);
                $size       = File::size($file_path);
                $filePath[] =
                    array('name' => $value->image_name, 'size' => $size, 'path' => asset('storage/institutions/'
                                                                                         . $value->image_name));
            }
        }

        return response()->json(['success' => true, 'data' => $filePath]);
    }

}

?>

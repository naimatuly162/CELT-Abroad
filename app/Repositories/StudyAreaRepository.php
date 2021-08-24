<?php
namespace App\Repositories;

use App\Contracts\StudyAreaContract;
use App\Model\StudyArea;
use App\Model\StudyAreaTranslation;
use Illuminate\Support\Facades\Storage;

class StudyAreaRepository implements StudyAreaContract
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
        $image=$data['image'];
        unset($data['image']);
        foreach ($data as $key => $value) {
            if($value['title'] != NULL)
            {
                $d['title'] = $value['title'];
                $d['description'] = $value['description'] ?? NULL;
                $datas[$key] = $d;
            }

        }


        $studyArea =  new StudyArea;

        if (isset($image)) {
            $file = $image ;
            $logo_name = rand(100000, 999999) . '.' . $file->getClientOriginalExtension();
            self::checkDirectory('studyArea');
            $file->move(Storage::disk('public')->path('studyArea'), $logo_name);
            $datas['image'] = $logo_name;
        }

        $studyArea->fill($datas)->save();
        return $studyArea;
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
        $image=$data['image'];
        unset($data['image']);
        foreach ($data as $key => $value) {
            if($value['title'] != NULL)
            {
                $d['title'] = $value['title'];
                $d['description'] = $value['description'] ?? NULL;
                $datas[$key] = $d;
            }
        }
        $studyArea =  StudyArea::find($id);

        if (isset($image)) {
            $file = $image;
            $logo_name = rand(100000, 999999) . '.' . $file->getClientOriginalExtension();
            self::checkDirectory('country');
            $file->move(Storage::disk('public')->path('studyArea'), $logo_name);
            $country_image = Storage::disk('public')->path('studyArea') . $logo_name;
            $datas['image'] = $logo_name;
        }

        $studyArea->fill($datas)->save();
        return $studyArea;
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
        $studyArea = StudyArea::find($id);
        $studyArea->translations()->delete();
        $studyArea->delete();

        return response()->json(['success' => true]);
    }

    public static function checkDirectory($dir)
    {
        if (!Storage::disk('public')->exists($dir)) {
            Storage::disk('public')->makeDirectory($dir);
        }
    }

}

?>

<?php
namespace App\Repositories;

use App\Contracts\FAQContract;
use App\Model\FAQ\Faq;

class FAQRepository implements FAQContract
{
    /**
     * store new FAQ in database
     *
     * @param array $data
     *
     * @return \App\Models\FAQ
     */
    public function save(array $data)
    {
        $faq =  new Faq;
        if($data['type'] == 1){
            $faq->type=$data['type'];
            $faq->program_id = isset($data['program_id']) ? $data['program_id'] : NULL;
            $faq->institution_id = isset($data['institution_id']) ? $data['institution_id'] : NULL;
            $faq->country_id = isset($data['country_id']) ? $data['country_id'] : NULL;
        }else{
            $faq->type=$data['type'];
            $faq->program_id =NULL;
            $faq->institution_id = isset($data['university_institution_id']) ? $data['university_institution_id'] : NULL;
            $faq->country_id = isset($data['university_country_id']) ? $data['university_country_id'] : NULL;
        }
        foreach ($data['faq'] as $key => $value) {
            $datas[$key] = $value;
        }
        $faq->fill($datas)->save();
        return $faq;
    }

    /**
     * update Faq in database
     *
     * @param array $data
     * @param int $id
     *
     * @return \App\Models\FAQ\Faq
     */
    public function update($data, int $id)
    {
        $faq =  Faq::find($id);

        $faq->type = $data['type'];
        $faq->program_id = isset($data['program_id']) ? $data['program_id'] : NULL;
        $faq->institution_id = isset($data['institution_id']) ? $data['institution_id'] : NULL;
        foreach ($data['faq'] as $key => $value) {
            $datas[$key] = $value;
        }

        $faq->fill($datas)->save();
        return $faq;
    }

    /**
     * delete Faq from database
     *
     * @param int $id
     *
     * @return boolean
     */
    public function delete(int $id)
    {
        $faq = Faq::where('id', $id)->first();
        $faq->translations()->delete();
        $faq->delete();

        return response()->json(['success'=> true]);
    }

}

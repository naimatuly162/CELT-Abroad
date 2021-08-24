<?php
namespace App\Repositories;

use App\Contracts\ExamContract;
use App\Contracts\ExamSubSectionContract;
use App\Model\Exam;
use App\Model\ExamSubSection;

class ExamSubSectionRepository implements ExamSubSectionContract
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
        $exam =  new ExamSubSection();
        $exam->exam_id = $data['exam_id'];
        foreach ($data['exam_subsection'] as $key => $value) {
            if($value['title'] != NULL)
            {
                $d['title'] = $value['title'];
                $datas[$key] = $d;
            }
        }
        $exam->fill($datas)->save();
        return $exam;
    }

    /**
     * update state in database
     *
     * @param array $data
     * @param int $id
     *
     * @return \App\Models\State
     */
    public function update(array $data)
    {
        //dd($data);
        $exam =  ExamSubSection::find((int)$data['exam_sub_section_id']);
        foreach ($data['exam_subsection'] as $key => $value) {
            if($value['title'] != NULL)
            {
                $d['title'] = $value['title'];
                $datas[$key] = $d;
            }
        }
        $exam->fill($datas)->save();
        return $exam;
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
        $exam = ExamSubSection::find($id);
        $exam->translations()->delete();
        $exam->delete();

        return response()->json(['success' => true]);
    }

}

?>

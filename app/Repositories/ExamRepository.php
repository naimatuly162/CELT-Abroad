<?php
namespace App\Repositories;

use App\Contracts\ExamContract;
use App\Model\Exam;

class ExamRepository implements ExamContract
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
        $exam =  new Exam;
        $exam->parent_id = $data['parent_id'];
        $exam->min = $data['min'];
        $exam->max = $data['max'];
        $exam->type = $data['type'];
        foreach ($data['exam'] as $key => $value) {
            if($value['title'] != NULL)
            {
                $d['title'] = $value['title'];
                $d['description'] = $value['description'] ?? NULL;
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
    public function update(array $data, int $id)
    {
        $exam =  Exam::find($id);
        $exam->parent_id = $data['parent_id'];
        $exam->min = $data['min'];
        $exam->max = $data['max'];
        $exam->type = $data['type'];
        foreach ($data['exam'] as $key => $value) {
            if($value['title'] != NULL)
            {
                $d['title'] = $value['title'];
                $d['description'] = $value['description'] ?? NULL;
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
        $exam = Exam::find($id);
        $exam->translations()->delete();
        $exam->delete();

        return response()->json(['success' => true]);
    }

}

?>
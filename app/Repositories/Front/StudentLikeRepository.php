<?php
namespace App\Repositories\Front;

use App\Contracts\Front\StudentLikeContract;
use App\Model\StudentFavoriteProgram;
use App\Model\StudentFavoriteUniversity;

class StudentLikeRepository implements StudentLikeContract
{
    public function studentLike(array $id, int $user_id)
    {
        $status = NULL;

        if($user_id && isset($id['university_id'])) {
            $fav_uni = StudentFavoriteUniversity::where('institution_id', $id['university_id'])
                                                ->where('student_id', $user_id)
                                                ->first();
            if(!$fav_uni)  {
                $fav_uni = new StudentFavoriteUniversity;
        
                $fav_uni->student_id = $user_id;
                $fav_uni->institution_id = $id['university_id'];
    
                $fav_uni->save();
                $status = 1;//like
            } else {
                $fav_uni->delete();
                $status = 0;//dislike
            }
        }

        if($user_id && isset($id['program_id'])) {
            $fav_program = StudentFavoriteProgram::where('program_id', $id['program_id'])
                                                ->where('student_id', $user_id)
                                                ->first();
            if(!$fav_program)  {
                $fav_program = new StudentFavoriteProgram;
        
                $fav_program->student_id = $user_id;
                $fav_program->program_id = $id['program_id'];
    
                $fav_program->save();
                $status = 1;//like
            } else {
                $fav_program->delete();
                $status = 0;//dislike
            }
        }

        return $status;
    }
}

?>
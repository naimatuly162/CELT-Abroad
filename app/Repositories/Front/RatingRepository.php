<?php
namespace App\Repositories\Front;

use App\Contracts\Front\RatingContract;
use App\Model\ProgramRating;

class RatingRepository implements RatingContract
{
    public function store(array $data)
    {
        $rating = new ProgramRating();
        $rating->institution_program_id = $data['program_id'];
        $rating->student_id = auth()->id();
        $rating->rating = $data['program_rating'] ?? 0;
        $rating->review = $data['program_comment'] ?? null;
        $rating->save();
        return $rating;
    }


}

?>

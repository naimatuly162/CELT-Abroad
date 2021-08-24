<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Wishlist extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'user_id', 'institution_id', 'institution_program_id'
    ];

    public function programs(){
        return $this->belongsTo(InstitutionProgram::class,'institution_program_id');
    }
}

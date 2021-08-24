<?php

namespace App\Model\FAQ;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class FaqTranslation extends Model
{
    use SoftDeletes;
    
   	protected $fillable = [
   		'faq_id', 'question', 'answer',
   	];
}

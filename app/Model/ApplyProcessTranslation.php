<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ApplyProcessTranslation extends Model
{
    use SoftDeletes;
    protected $fillable=['country_id','locale','application_process'];
}

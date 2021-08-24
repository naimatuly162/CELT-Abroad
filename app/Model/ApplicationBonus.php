<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class ApplicationBonus extends Model
{
    protected $table='application_bonuses';

    protected $fillable=[
        'application_id',
        'bonus_id',
        'amount',
        'amount_usd',
    ];

    public function bonus()
    {
        return $this->belongsTo('App\Model\Bonus','bonus_id');
    }
}

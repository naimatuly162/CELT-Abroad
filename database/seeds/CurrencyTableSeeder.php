<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CurrencyTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('currencies')->insert([
            'code' => 'USD',
            'symbol' => '$',
            'usd_rate' => '74.36',
            'is_default' => 1,
        ]);
    }
}

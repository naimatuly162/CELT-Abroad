<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LocaleTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
       	DB::table('locales')->insert([
            'locale' => 'en',
            'title' => 'English',
            'is_default' => 1,
        ]);
    }
}

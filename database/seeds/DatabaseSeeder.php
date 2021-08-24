<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(AdminsTableSeeder::class);
        $this->call(LocaleTableSeeder::class);
        $this->call(CurrencyTableSeeder::class);
        $this->call(BlogCategoryTableSeeder::class);
        $this->call(BlogsTableSeeder::class);
    }
}

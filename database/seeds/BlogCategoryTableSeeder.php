<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class BlogCategoryTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('blog_categories')->insert([
            'id' => 1,
        ]);
        DB::table('blog_category_translations')->insert([
            'blog_category_id' => 1,
            'locale' => 'en',
            'title' => 'Scholarship',
        ]);
    }
}

<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Carbon\Carbon;

class BlogsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('blogs')->insert([
            'image' => asset('blog.jpeg'),
            'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
        ]);
        DB::table('blog_translations')->insert([
            'blog_id' => 1,
            'category_id' => 1,
            'locale' => 'en',
            'title' => 'Featured Scholarships',
            'description' => Str::random(40),
        ]);
    }
}

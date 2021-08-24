<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBlogCategoryTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('blog_category_translations', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('blog_category_id')->unsigned();
            $table->char('locale', 2);

            $table->string('title')->nullable();
            
            $table->foreign('locale')->references('locale')->on('locales')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('blog_category_id')->references('id')->on('blog_categories')->onUpdate('cascade')->onDelete('cascade');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('blog_category_translations');
    }
}

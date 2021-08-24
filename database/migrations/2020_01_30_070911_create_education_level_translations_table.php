<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEducationLevelTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('education_level_translations', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('education_level_id')->unsigned();
            $table->char('locale', 2);
            
            $table->string('title')->nullable();
            $table->text('description')->nullable();

            $table->foreign('locale')->references('locale')->on('locales')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('education_level_id')->references('id')->on('education_levels')->onUpdate('cascade')->onDelete('cascade');            
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
        Schema::dropIfExists('education_level_translations');
    }
}

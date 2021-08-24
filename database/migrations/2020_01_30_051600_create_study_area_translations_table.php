<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudyAreaTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('study_area_translations', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('study_area_id')->unsigned();
            $table->char('locale', 2);

            $table->string('title')->nullable();
            $table->text('description')->nullable();

            $table->foreign('locale')->references('locale')->on('locales')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('study_area_id')->references('id')->on('study_areas')->onUpdate('cascade')->onDelete('cascade');

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
        Schema::dropIfExists('study_area_translations');
    }
}

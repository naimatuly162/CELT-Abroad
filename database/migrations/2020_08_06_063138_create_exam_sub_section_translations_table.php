<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExamSubSectionTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('exam_sub_section_translations', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('exam_sub_section_id')->unsigned();
            $table->char('locale', 2);

            $table->string('title')->nullable();

            $table->foreign('locale')->references('locale')->on('locales')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('exam_sub_section_id')->references('id')->on('exam_sub_sections')->onUpdate('cascade')->onDelete('cascade');

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
        Schema::dropIfExists('exam_sub_section_translations');
    }
}

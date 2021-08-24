<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMatchRequirementsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('match_requirements', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->bigInteger('user_id')->unsigned()->nullable();
            $table->foreign('user_id')->references('id')->on('users')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('education_level_id')->unsigned()->nullable();
            $table->foreign('education_level_id')->references('id')->on('education_levels')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('country_id')->unsigned()->nullable();
            $table->foreign('country_id')->references('id')->on('countries')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('study_type_id')->unsigned()->nullable();
            $table->foreign('study_type_id')->references('id')->on('study_types')->onUpdate('cascade')->onDelete('cascade');

            $table->string('study_area_id')->default("[]");
            $table->string('study_destination')->nullable();

            $table->bigInteger('session_id')->unsigned()->nullable();
            $table->foreign('session_id')->references('id')->on('sessions')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('previous_study_level')->nullable();


            $table->bigInteger('exam_id')->unsigned()->nullable();
            $table->foreign('exam_id')->references('id')->on('exams')->onUpdate('cascade')->onDelete('cascade');

            $table->decimal('score', 10, 2)->default(0);

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
        Schema::dropIfExists('match_requirements');
    }
}

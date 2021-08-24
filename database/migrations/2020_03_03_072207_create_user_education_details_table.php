<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserEducationDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_education_details', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('user_id')->unsigned();
            $table->bigInteger('edu_country_id')->unsigned();
            $table->bigInteger('edu_highest_level_id')->unsigned();
            $table->float('edu_grade_average');
            $table->bigInteger('edu_grade_scheme_id')->unsigned();
            $table->bigInteger('study_program_level_id')->unsigned()->nullable();
            $table->bigInteger('study_area_id')->unsigned()->nullable();
            $table->foreign('user_id')->references('id')->on('users')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('edu_country_id')->references('id')->on('countries')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('edu_highest_level_id')->references('id')->on('education_levels')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('edu_grade_scheme_id')->references('id')->on('grading_schemes')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('study_program_level_id')->references('id')->on('education_levels')->onUpdate('cascade')->onDelete('cascade');
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
        Schema::dropIfExists('user_education_details');
    }
}

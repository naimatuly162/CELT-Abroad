<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGradingSchemeCounrtyEducationLevelsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('grading_scheme_counrty_education_levels', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('grading_scheme_id')->unsigned();
            $table->bigInteger('country_id')->unsigned();
            $table->bigInteger('education_level_id')->unsigned();
            
            $table->foreign('grading_scheme_id','gd_id')->references('id')->on('grading_schemes')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('country_id')->references('id')->on('countries')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('education_level_id' ,'e_id')->references('id')->on('education_levels')->onUpdate('cascade')->onDelete('cascade');
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
        Schema::dropIfExists('grading_scheme_counrty_education_levels');
    }
}

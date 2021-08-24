<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTestRequirementsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('test_requirements', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('user_id')->unsigned()->nullable();
            $table->foreign('user_id')->references('id')->on('users')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('country_id')->unsigned()->nullable();
            $table->foreign('country_id')->references('id')->on('countries')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('education_level_id')->unsigned()->nullable();
            $table->foreign('education_level_id')->references('id')->on('education_levels')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('study_area_id')->unsigned()->nullable();
            $table->foreign('study_area_id')->references('id')->on('study_areas')->onUpdate('cascade')->onDelete('cascade');

            $table->tinyInteger('activity')->default(1)->comment('1=physical,2=without physical, 3=creative');
            $table->boolean('start_business')->default(0)->comment('0=No,1=yes');
            $table->tinyInteger('teach_people')->default(0)->comment('0=No,1=yes,2=not sure');
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
        Schema::dropIfExists('test_requirements');
    }
}

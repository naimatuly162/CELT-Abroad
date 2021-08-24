<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserSchoolsAttendedsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_schools_attendeds', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('user_id')->unsigned();
            $table->bigInteger('at_edu_level_id')->unsigned();
            $table->bigInteger('at_edu_country_id')->unsigned();
            $table->string('at_edu_institution_name');
            $table->string('at_edu_primary_institution_language');
            $table->date('at_edu_from_date');
            $table->string('at_edu_degree_award');
            $table->date('at_edu_degree_award_date');
            $table->longText('at_edu_school_address');
            $table->foreign('user_id')->references('id')->on('users')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('at_edu_level_id')->references('id')->on('education_levels')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('at_edu_country_id')->references('id')->on('countries')->onUpdate('cascade')->onDelete('cascade');
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
        Schema::dropIfExists('user_schools_attendeds');
    }
}

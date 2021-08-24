<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCountryWiseEducationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('country_wise_education', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('residential_country_id')->unsigned();
            $table->bigInteger('destination_country_id')->unsigned();
            $table->bigInteger('residential_degree_id')->unsigned();
            $table->bigInteger('destination_degree_id')->unsigned();

            $table->foreign('residential_country_id')->references('id')->on('countries')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('destination_country_id')->references('id')->on('countries')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('residential_degree_id')->references('id')->on('education_levels')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('destination_degree_id')->references('id')->on('education_levels')->onUpdate('cascade')->onDelete('cascade');
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
        Schema::dropIfExists('country_wise_education');
    }
}

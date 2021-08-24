<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInstitutionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('institutions', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('slug')->nullable();
            $table->string('name');

            $table->bigInteger('type_id')->unsigned();
            $table->foreign('type_id')->references('id')->on('institution_types')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('country_id')->unsigned();
            $table->foreign('country_id')->references('id')->on('countries')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('state_id')->unsigned();
            $table->foreign('state_id')->references('id')->on('states')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('city_id')->unsigned();
            $table->foreign('city_id')->references('id')->on('cities')->onUpdate('cascade')->onDelete('cascade');

            $table->string('cover_photo')->nullable();
            $table->bigInteger('national_ranking');
            $table->bigInteger('global_ranking');
            $table->text('description');
            $table->string('youtube_url');
            $table->boolean('is_featured')->default(0);

            $table->bigInteger('unirep_id')->unsigned();    
            $table->foreign('unirep_id')->references('id')->on('university_representatives')->onUpdate('cascade')->onDelete('cascade');
            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('institutions');
    }
}

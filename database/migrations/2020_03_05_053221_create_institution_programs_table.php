<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInstitutionProgramsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('institution_programs', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->bigInteger('institution_id')->unsigned();
            $table->foreign('institution_id')->references('id')->on('institutions')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('country_id')->unsigned();
            $table->foreign('country_id')->references('id')->on('countries')->onUpdate('cascade')->onDelete('cascade');
           
            $table->string('slug');
            $table->string('cover')->nullable();
            $table->decimal('tuition_fees',10,2)->default(0);
            $table->integer('fees_type')->default(1)->comment('1=year 2=month');
            $table->decimal('scholarship',10,2)->default(0);
            $table->bigInteger('subject_ranking');
            $table->bigInteger('gpa')->nullable();

            $table->bigInteger('current_degree_level_id')->unsigned()->nullable();
            $table->foreign('current_degree_level_id' ,'dl_id')->references('id')->on('education_levels')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('degree_level_id')->unsigned()->nullable();
            $table->foreign('degree_level_id')->references('id')->on('education_levels')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('study_type_id')->unsigned()->nullable();
            $table->foreign('study_type_id')->references('id')->on('study_types')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('study_duration_id')->unsigned()->nullable();
            $table->foreign('study_duration_id')->references('id')->on('study_durations')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('language_id')->unsigned()->nullable();
            $table->foreign('language_id')->references('id')->on('languages')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('currency_id')->unsigned()->nullable();
            $table->foreign('currency_id')->references('id')->on('currencies')->onUpdate('cascade')->onDelete('cascade');

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
        Schema::dropIfExists('institution_programs');
    }
}

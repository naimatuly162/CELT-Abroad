<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInstitutionProgramExamRequirementDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('institution_program_exam_requirement_details', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('requirement_id')->unsigned()->nullable();
            $table->bigInteger('subsection_id')->unsigned()->nullable();
            $table->float('score')->nullable();

            //$table->foreign('requirement_id')->references('id')->on('institution_program_exam_requirements');
            //$table->foreign('subsection_id')->references('id')->on('exam_sub_sections');
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
        Schema::dropIfExists('institution_program_exam_requirement_details');
    }
}

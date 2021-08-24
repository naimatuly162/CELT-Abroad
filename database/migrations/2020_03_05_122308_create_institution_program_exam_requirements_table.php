<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInstitutionProgramExamRequirementsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('institution_program_exam_requirements', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->bigInteger('institution_program_id')->unsigned();
            $table->foreign('institution_program_id','institute_program_id_foreign')->references('id')->on('institution_programs')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('exam_id');
            $table->decimal('score');
            $table->decimal('reading_score',10,2);
            $table->decimal('listening_score',10,2);
            $table->decimal('speaking_score',10,2);
            $table->decimal('writing_score',10,2);

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
        Schema::dropIfExists('institution_program_exam_requirements');
    }
}

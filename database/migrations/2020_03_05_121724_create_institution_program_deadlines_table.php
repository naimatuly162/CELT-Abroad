<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInstitutionProgramDeadlinesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('institution_program_deadlines', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('institution_program_id')->unsigned();
            $table->foreign('institution_program_id')->references('id')->on('institution_programs')->onUpdate('cascade')->onDelete('cascade');

            $table->string('start_date');
            $table->string('last_date');

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
        Schema::dropIfExists('institution_program_deadlines');
    }
}

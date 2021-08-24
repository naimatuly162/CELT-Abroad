<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInstitutionProgramTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('institution_program_translations', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->bigInteger('institution_program_id')->unsigned();
            $table->foreign('institution_program_id')->references('id')->on('institution_programs')->onUpdate('cascade')->onDelete('cascade');

            $table->char('locale', 2);
            $table->foreign('locale')->references('locale')->on('locales')->onUpdate('cascade')->onDelete('cascade');

            $table->string('title');
            $table->string('description')->nullable();

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
        Schema::dropIfExists('institution_program_translations');
    }
}

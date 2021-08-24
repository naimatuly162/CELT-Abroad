<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGradingSchemeDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('grading_scheme_data', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('grading_scheme_id')->unsigned();
            $table->decimal('max', 8, 2)->nullable();
            $table->tinyInteger('position')->default(0);

            $table->foreign('grading_scheme_id')->references('id')->on('grading_schemes')->onUpdate('cascade')->onDelete('cascade');
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
        Schema::dropIfExists('grading_scheme_data');
    }
}

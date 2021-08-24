<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserTestScoreDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_test_score_details', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('score_id')->unsigned()->nullable();
            $table->bigInteger('subsection_id')->unsigned()->nullable();
            $table->float('score')->nullable();

            $table->foreign('score_id')->references('id')->on('user_test_scores');
            $table->foreign('subsection_id')->references('id')->on('exam_sub_sections');
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
        Schema::dropIfExists('user_test_score_details');
    }
}

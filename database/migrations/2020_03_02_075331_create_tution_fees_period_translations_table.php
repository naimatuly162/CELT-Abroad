<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTutionFeesPeriodTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tution_fees_period_translations', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('tution_fees_period_id')->unsigned();
            $table->char('locale', 2);

            $table->string('title')->nullable();

            $table->foreign('locale')->references('locale')->on('locales')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('tution_fees_period_id')->references('id')->on('tution_fees_periods')->onUpdate('cascade')->onDelete('cascade');
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
        Schema::dropIfExists('tution_fees_period_translations');
    }
}

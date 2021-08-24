<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddStartMonthAndLastMonthInInstitutionProgramDeadlinesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('institution_program_deadlines', function (Blueprint $table) {
            $table->integer('start_month')->after('start_date');
            $table->integer('last_month')->after('last_date');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('institution_program_deadlines', function (Blueprint $table) {
            //
        });
    }
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RemoveStartDateAndEndDateInInstitutionProgramDeadlinesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('institution_program_deadlines', function (Blueprint $table) {
            $table->dropColumn('start_date');
            $table->dropColumn('last_date');
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
            $table->interger('start_date');
            $table->interger('last_date');
        });
    }
}

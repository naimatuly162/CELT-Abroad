<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddYearAndSeasonColumnInUserEducationDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('user_education_details', function (Blueprint $table) {
            $table->integer('study_start_year')->nullable()->after('study_start_date');
            $table->string('study_start_season')->nullable()->after('study_start_date');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('user_education_details', function (Blueprint $table) {
            $table->dropColumn('study_start_year');
            $table->dropColumn('study_start_season');
        });
    }
}

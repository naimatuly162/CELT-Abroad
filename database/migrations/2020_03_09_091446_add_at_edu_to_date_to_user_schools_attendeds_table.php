<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddAtEduToDateToUserSchoolsAttendedsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('user_schools_attendeds', function (Blueprint $table) {
            $table->date('at_edu_to_date')->after('at_edu_from_date');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('user_schools_attendeds', function (Blueprint $table) {
            $table->dropColumn('at_edu_to_date');
        });
    }
}

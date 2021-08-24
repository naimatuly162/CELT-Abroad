<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeStudyAreaIdInUserEducationDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('user_education_details', function (Blueprint $table) {
            $table->dropForeign('user_education_details_study_area_id_foreign');
        });
        Schema::table('user_education_details', function (Blueprint $table) {
            $table->string('study_area_id')->nullable()->change();
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
            $table->bigInteger('study_area_id')->unsigned()->nullable()->change();
        });
    }
}

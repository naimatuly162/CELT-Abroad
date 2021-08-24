<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddFieldInApplicationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('applications', function (Blueprint $table) {
            $table->bigInteger('status')->comment('1-apply 2-accept 3-reject')->nullable()->after('student_id');

            $table->bigInteger('bonus_id')->unsigned()->nullable()->after('status');
            $table->foreign('bonus_id')->references('id')->on('bonuses')->onUpdate('cascade')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('applications', function (Blueprint $table) {
            $table->dropColumn('status');
            $table->dropColumn('bonus_id');
        });
    }
}

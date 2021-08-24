<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeTypeInExamsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('exams', function (Blueprint $table) {
            $table->dropColumn('type');
        });
        Schema::table('exams', function (Blueprint $table) {
            $table->enum('type', ['english','aptitude'])->default('english');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('exams', function (Blueprint $table) {
            $table->dropColumn('type');
        });
        Schema::table('exams', function (Blueprint $table) {
            $table->boolean('type')->default(true);
        });
    }
}

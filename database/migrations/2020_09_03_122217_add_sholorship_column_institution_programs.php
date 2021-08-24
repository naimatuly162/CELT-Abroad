<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddSholorshipColumnInstitutionPrograms extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('institution_programs', function (Blueprint $table) {
            $table->integer('scholarship_type')->comment('1-amount,2-percentage')->default(1)->after('gpa');
            $table->float('scholarship_value')->after('scholarship_type')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('institution_programs', function (Blueprint $table) {
            $table->dropColumn('scholarship_type');
            $table->dropColumn('scholarship_value');
        });
    }
}

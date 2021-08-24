<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddFieldInInstitutionPrograms extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('institution_programs', function (Blueprint $table) {
             $table->decimal('tuition_fees_usd',10,2)->after('tuition_fees');
             $table->decimal('scholarship_usd',10,2)->after('scholarship');
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
            //
        });
    }
}

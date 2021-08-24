<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddIsFeatureInInstitutionPrograms extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('institution_programs', function (Blueprint $table) {
             $table->boolean('is_active')->default(0)->after('unirep_id');
             $table->boolean('is_featured')->default(0)->after('is_active');
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

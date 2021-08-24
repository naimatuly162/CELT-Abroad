<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddAmountApplicationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('applications', function (Blueprint $table) {
             $table->decimal('amount')->comment('bonus amount')->nullable()->after('bonus_id');
             $table->decimal('amount_usd')->comment('bonus amount usd')->nullable()->after('amount');
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
             $table->dropColumn('amount');
             $table->dropColumn('amount_usd');
        });
    }
}

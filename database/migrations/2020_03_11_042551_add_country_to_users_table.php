<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddCountryToUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->bigInteger('country')->nullable()->unsigned()->after('address');
            $table->foreign('country')->references('id')->on('countries')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('state')->nullable()->unsigned()->after('country');
            $table->foreign('state')->references('id')->on('states')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('city')->nullable()->unsigned()->after('state');
            $table->foreign('city')->references('id')->on('cities')->onUpdate('cascade')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            //
        });
    }
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddFieldInUniversityRepresentativesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('university_representatives', function (Blueprint $table) {
            $table->string('image')->nullable()->after('password');
            $table->string('first_name')->nullable()->after('image');
            $table->string('last_name')->nullable()->after('first_name');
            $table->string('phone')->nullable()->after('last_name');
            $table->string('title')->nullable()->after('phone');
            $table->string('address')->nullable()->after('title');
            $table->string('zipcode')->nullable()->after('address');

            $table->bigInteger('country_id')->nullable()->unsigned()->after('zipcode');
            $table->foreign('country_id')->references('id')->on('countries')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('state_id')->nullable()->unsigned()->after('country_id');
            $table->foreign('state_id')->references('id')->on('states')->onUpdate('cascade')->onDelete('cascade');

            $table->bigInteger('city_id')->nullable()->unsigned()->after('state_id');
            $table->foreign('city_id')->references('id')->on('cities')->onUpdate('cascade')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('university_representatives', function (Blueprint $table) {
            //
        });
    }
}

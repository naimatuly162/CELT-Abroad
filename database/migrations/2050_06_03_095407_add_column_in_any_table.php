<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnInAnyTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            if ($this->ifNotExist('users', 'provider')) {
                $table->string('provider')->nullable();
            }
            if ($this->ifNotExist('users', 'provider_id')) {
                $table->string('provider_id')->nullable();
            }


        });
        Schema::table('institutions', function (Blueprint $table) {
            if ($this->ifNotExist('institutions', 'logo')) {
                $table->string('logo', 120)->after('cover_photo')->nullable();
            }
            if ($this->ifNotExist('institutions', 'mini_cover')) {
                $table->string('mini_cover', 120)->after('cover_photo')->nullable();
            }


        });
        Schema::table('institution_programs', function (Blueprint $table) {

            if ($this->ifNotExist('institution_programs', 'discipline_id')) {
                $table->string('discipline_id', 30)->after('state_id')->nullable();
            }

        });
        Schema::table('institution_program_deadlines', function (Blueprint $table) {
            if ($this->ifNotExist('institution_program_deadlines', 'session_id')) {
                $table->unsignedBigInteger('session_id')->after('institution_program_id')->nullable();
                $table->foreign('session_id')->references('id')->on('sessions');
            }

        });

        Schema::table('university_representatives', function (Blueprint $table) {
            if ($this->ifNotExist('university_representatives', 'otp')) {
                $table->integer('otp')->after('city_id')->nullable();
            }

        });
        Schema::table('institutions', function (Blueprint $table) {
            if ($this->ifNotExist('institutions', 'logo')) {
                $table->string('logo')->after('is_active')->nullable();
            }
            if ($this->ifNotExist('institutions', 'faculty')) {
                $table->double('faculty')->after('city_id')->nullable();
            }
            if ($this->ifNotExist('institutions', 'qs_ranking')) {
                $table->integer('qs_ranking')->after('global_ranking')->nullable();
            }
        });

        Schema::table('blog_translations', function (Blueprint $table) {
            if ($this->ifNotExist('blog_translations', 'slug')) {
                $table->string('slug')->after('title')->nullable();
            }

        });

        Schema::table('study_areas', function (Blueprint $table) {

            if ($this->ifNotExist('study_areas', 'image')) {
                $table->string('image')->after('id')->nullable();
            }

        });
        Schema::table('country_translations', function (Blueprint $table) {

            if ($this->ifNotExist('country_translations', 'study_process')) {
                $table->string('study_process')->after('description')->nullable();
            }
            if ($this->ifNotExist('country_translations', 'study_process_2')) {
                $table->string('study_process_2')->after('study_process')->nullable();
            }
            if ($this->ifNotExist('country_translations', 'study_process_3')) {
                $table->string('study_process_3')->after('study_process_2')->nullable();
            }

        });
        /*Schema::table('match_requirements', function ($table) {
            if ($this->ifNotExist('match_requirements', 'user_id')) {
                $table->integer('user_id');
            }
        });*/

        Schema::table('countries', function (Blueprint $table) {

            if ($this->ifNotExist('countries', 'region_id')) {
                $table->bigInteger('region_id')->after('id')->unsigned()->nullable();
                $table->foreign('region_id')->references('id')->on('regions')->onUpdate('cascade')->onDelete('cascade');
            }

        });

        /*Schema::table('match_requirements', function (Blueprint $table) {

            if ($this->ifNotExist('match_requirements', 'study_destination')) {
                $table->string('study_destination')->after('study_area_id')->nullable();
            }

        });*/

        Schema::table('institutions', function (Blueprint $table) {

            if ($this->ifNotExist('institutions', 'about_youtube_url')) {
                $table->string('about_youtube_url')->after('youtube_url')->nullable();
            }

        });
        Schema::table('match_requirements', function (Blueprint $table) {

            if ($this->ifNotExist('match_requirements', 'study_area_id')) {
                $table->string('study_area_id')->after('study_type_id')->default([]);
            }

        });

        /*Schema::table('match_requirements', function (Blueprint $table) {

            $table->dropForeign('match_requirements_study_area_id_foreign');
            $table->dropIndex('match_requirements_study_area_id_foreign');

        });

        Schema::table('match_requirements', function (Blueprint $table) {
            $table->string('study_area_id')->change()->default("[]");
        });*/


    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('any', function (Blueprint $table) {
            //
        });
    }

    /**
     * @param $table
     * @param $column
     * @return bool
     */
    public function ifNotExist($table, $column)
    {
        if (Schema::hasColumn($table, $column)) {
            return false;
        }
        return true;
    }


}

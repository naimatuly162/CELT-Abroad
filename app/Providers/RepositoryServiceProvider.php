<?php

namespace App\Providers;

use App\Contracts\ApplyProcessContract;
use Illuminate\Support\ServiceProvider;

class RepositoryServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind('App\Contracts\StateContract', 'App\Repositories\StateRepository');
        $this->app->bind('App\Contracts\RegionContract', 'App\Repositories\RegionRepository');
        $this->app->bind('App\Contracts\CountryContract', 'App\Repositories\CountryRepository');
        $this->app->bind('App\Contracts\CountryVisaContract', 'App\Repositories\CountryVisaRepository');
        $this->app->bind('App\Contracts\CountryLivingContract', 'App\Repositories\CountryLivingRepository');
        $this->app->bind('App\Contracts\ApplyProcessContract', 'App\Repositories\ApplyProcessRepository');
        $this->app->bind('App\Contracts\CityContract', 'App\Repositories\CityRepository');
        $this->app->bind('App\Contracts\LocaleContract', 'App\Repositories\LocaleRepository');
        $this->app->bind('App\Contracts\StudyAreaContract', 'App\Repositories\StudyAreaRepository');
        $this->app->bind('App\Contracts\InstitutionTypeContract', 'App\Repositories\InstitutionTypeRepository');
        $this->app->bind('App\Contracts\VarsityAboutContract', 'App\Repositories\VarsityAboutRepository');
        $this->app->bind('App\Contracts\StudyTypeContract', 'App\Repositories\StudyTypeRepository');
        $this->app->bind('App\Contracts\SessionContract', 'App\Repositories\SessionRepository');
        $this->app->bind('App\Contracts\BonusContract', 'App\Repositories\BonusRepository');
        $this->app->bind('App\Contracts\TutionFeeContract', 'App\Repositories\TutionFeeRepository');
        $this->app->bind('App\Contracts\ExamContract', 'App\Repositories\ExamRepository');
        $this->app->bind('App\Contracts\FoundationRouteContract', 'App\Repositories\FoundationRouteRepository');
        $this->app->bind('App\Contracts\PrefilledDateContract', 'App\Repositories\PrefilledDateRepository');
        $this->app->bind('App\Contracts\UniversityRepresentativeContract', 'App\Repositories\UniversityRepresentativeRepository');
        $this->app->bind('App\Contracts\InstitutionContract', 'App\Repositories\InstitutionRepository');
        $this->app->bind('App\Contracts\InstitutionProgramContract', 'App\Repositories\InstitutionProgramRepository');
        $this->app->bind('App\Contracts\BlogContract', 'App\Repositories\BlogRepository');
        $this->app->bind('App\Contracts\BlogCategoryContract', 'App\Repositories\BlogCategoryRepository');
        $this->app->bind('App\Contracts\FAQContract', 'App\Repositories\FAQRepository');
        $this->app->bind('App\Contracts\ApplicationContract', 'App\Repositories\ApplicationRepository');
        $this->app->bind('App\Contracts\ExamSubSectionContract', 'App\Repositories\ExamSubSectionRepository');
        $this->app->bind('App\Contracts\CountryWiseEducationContract', 'App\Repositories\CountryWiseEducationRepository');

        // front
        $this->app->bind('App\Contracts\Front\ProgramContract','App\Repositories\Front\ProgramRepository');
        $this->app->bind('App\Contracts\Front\InstitutionContract','App\Repositories\Front\InstitutionRepository');
        $this->app->bind('App\Contracts\Front\StudentProfileContract','App\Repositories\Front\StudentProfileRepository');
        $this->app->bind('App\Contracts\Front\UniversityContract','App\Repositories\Front\UniversityRepository');
        $this->app->bind('App\Contracts\Front\ScholarshipContract','App\Repositories\Front\ScholarshipRepository');
        $this->app->bind('App\Contracts\Front\ContactUsContract','App\Repositories\Front\ContactUsRepository');
        $this->app->bind('App\Contracts\Front\ApplicationContract','App\Repositories\Front\ApplicationRepository');
        $this->app->bind('App\Contracts\Front\StudentLikeContract','App\Repositories\Front\StudentLikeRepository');
        $this->app->bind('App\Contracts\Front\UniversitySettingContract','App\Repositories\Front\UniversitySettingRepository');
        $this->app->bind('App\Contracts\Front\UniversityStudentContract','App\Repositories\Front\UniversityStudentRepository');
        $this->app->bind('App\Contracts\Front\RatingContract','App\Repositories\Front\RatingRepository');
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}

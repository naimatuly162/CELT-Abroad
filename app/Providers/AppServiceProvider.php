<?php

namespace App\Providers;

use App\Model\Blog\Blog;
use App\Model\Country;
use App\Model\Discipline;
use App\Model\EducationLevel;
use App\Model\Exam;
use App\Model\FAQ\Faq;
use App\Model\Locale;
use App\Model\MatchRequirement;
use App\Model\Session;
use App\Model\StudyArea;
use App\Model\StudyType;
use App\Model\TestRequirement;
use App\Model\UserMatchScore;
use App\Model\Wishlist;
use App\Services\Locales;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\ServiceProvider;
use App\Model\User;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Schema;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
         $this->registerTranslatableHelper();
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);
        //  User::creating(function ($user) {
        //     if ( ! $user->isValid()) {
        //         return false;
        //     }
        // });
        View::composer(
            'layouts.header', function($view){
                $locales = \App\Model\Locale::all();
                $current_locale = !empty(app()->getLocale()) ? $locales->where('locale', app()->getLocale())->first()
                    : $locales->where('is_default', 1)->first();

                $view->with('locales', $locales->where('locale', '<>', $current_locale->locale))->with('current_locale', $current_locale);
            }
        );

//        View::composer(
//            'front.design.partials.nav-new', function($view){
//            $locales = \App\Model\Locale::all();
//            $locale =  Config::get('app.locale');
//            $current_locale = !empty(app()->getLocale()) ? $locales->where('locale', app()->getLocale())->first()
//                : $locales->where('is_default', 1)->first();
//
//            $view->with('localeList', $locales->where('locale', '<>', $current_locale->locale))
//                ->with(['current_locale'=>$current_locale,'locale'=>$locale]);
//        }
//        );
        View::composer(
            'front.*', function($view){
            $locales = \App\Model\Locale::all();
            $locale =  Config::get('app.locale');
            $current_locale = !empty(app()->getLocale()) ? $locales->where('locale', app()->getLocale())->first()
                : $locales->where('is_default', 1)->first();

            $user_wishlists=Wishlist::where('user_id',auth()->id())->with('programs')->get();
            //$view->with('localeList', $locales->where('locale', '<>', $current_locale->locale))

            //matching data
            $study_countries = Country::get();
            $disciplines = Discipline::take(12)->get();
            $study_areas = StudyArea::get();
            $study_types = StudyType::get();
            $session_types = Session::has('sessions')->get();
            $exam_tests = Exam::has('exams')->get();
            $testRequirement = TestRequirement::where('user_id', auth()->id())->first();
            $matchRequirement = MatchRequirement::where('user_id', auth()->id())->first();
            $user_match_score=UserMatchScore::where('user_id', auth()->id())->get()->pluck('overall_score','exam_id')->toArray();
//            dd(collect(session()->get('match-requirements.user_test_score'))->pluck('score','exam_id')->toArray());
            $education_labels = EducationLevel::get();
            $view->with('localeList', $locales)
                ->with(['current_locale'=>$current_locale,'locale'=>$locale])
                ->with(['user_wishlists'=>$user_wishlists])
                ->with(['study_countries'=>$study_countries,
                    'disciplines'=>$disciplines,
                    'study_areas'=>$study_areas,
                    'study_types'=>$study_types,
                    'session_types'=>$session_types,
                    'exam_tests'=>$exam_tests,
                    'testRequirement'=>$testRequirement,
                    'matchRequirement'=>$matchRequirement,
                    'education_labels'=>$education_labels,
                    'user_match_score'=>$user_match_score
                ]);
        }
        );
        View::composer(
            ['front.design.pages.home','front.common.blog','front.design.pages.scholarship','front.design.pages.country','front.design.pages.program-single'], function($view){
            $blogs=Blog::take(4)->orderByDesc('id')->get();
            $faqs = Faq::whereNull('institution_id')->whereNull('program_id')->take(10)->get();
            $view->with(['blogs'=> $blogs,'faqs'=>$faqs]);
        }
        );

            // \DB::listen(function($query) {
            //     \Log::info('sql statement', [
            //         'sql query' => $query->sql,
            //         'sql bindings' => $query->bindings,
            //     ]);
            // });
    }

    protected function registerTranslatableHelper()
    {
        $this->app->singleton('locales', Locales::class);
        $this->app->singleton(\Astrotomic\Translatable\Locales::class, Locales::class);
    }
}

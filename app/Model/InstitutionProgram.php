<?php

namespace App\Model;

use App\Helpers\MatchingToolHelper;
use App\Scopes\StuduntProgramEligibilityScope;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class InstitutionProgram extends AbstractTranslatableModel
{
    protected $fillable = [
        'id',
        'slug',
        'institution_id',
        'country_id',
        'state_id',
        'city_id',
        'cover',
        'tuition_fees',
        'tuition_fees_usd',
        'fees_type',
        'gpa',
        'scholarship_type',
        'scholarship_value',
        'scholarship',
        'scholarship_usd',
        'subject_ranking',
        'current_degree_level_id',
        'degree_level_id',
        'study_type_id',
        'study_duration_id',
        'language_id',
        'currency_id',
        'unirep_id',
        'application_fee',
        'is_active',
        'is_featured',
    ];

    protected $appends = [
        'currencies', 'scholarship_amount', 'fees_amount', 'amount_to_pay', 'amount_to_pay_new', 'currencies_id', 'is_eligible', 'is_wishlist', 'is_scholarship'
    ];

    protected static function boot()
    {
        parent::boot();

        if (auth()->check() && auth()->user()->is_student && (auth()->user()->profile_progress == 100)) {
            static::addGlobalScope(new StuduntProgramEligibilityScope);
        }
    }

    /**
     * @return bool
     */
    public function getIsEligibleAttribute(): bool
    {
        $institutionProgram = InstitutionProgram::query()->find($this->id);
        return MatchingToolHelper::eligiblePrograms($institutionProgram, true);
    }

    /**
     * @return bool
     */
    /*public function checkEligibleProgram(): bool
    {
        $eligible           = false;
        $institutionProgram = InstitutionProgram::query()->find($this->id);

        $matchingTool     = MatchingToolHelper::getMatchingTool();
        $matchRequirement = $matchingTool['match_requirement'];
        if (auth()->check() && $matchRequirement) {
            $userMatchScores = $matchingTool['user_match_score'];

            if ($matchRequirement['education_level_id'])
                $institutionProgram =
                    $institutionProgram->where('current_degree_level_id', $matchRequirement['education_level_id']);

            if ($matchRequirement['study_type_id'])
                $institutionProgram = $institutionProgram->where('study_type_id', $matchRequirement['study_type_id']);

            if ($matchRequirement['study_destination'])
                $institutionProgram =
                    $institutionProgram->whereIn('country_id', $matchRequirement['study_destination']);

            if ($matchRequirement['session_id'])
                $institutionProgram =
                    $institutionProgram->whereHas('institutionProgramDeadlines', function ($q) use ($matchRequirement) {
                        return $q->where('session_id', $matchRequirement['session_id']);
                    });

            if ($matchRequirement['study_area_id'])
                $institutionProgram =
                    $institutionProgram->whereHas('studyAreas', function ($q) use ($matchRequirement) {
                        return $q->whereIn('study_area_id', $matchRequirement['study_area_id']);
                    });

            if (count($userMatchScores))
                $institutionProgram = $institutionProgram
                    ->whereHas('institutionProgramExamRequirements', function ($q) use ($userMatchScores) {
                        foreach ($userMatchScores as $key => $userMatchScore) {
                            if ($key == 0) {
                                $q->where([
                                    ['exam_id', $userMatchScore['exam_id']],
                                    ['score', '>=', $userMatchScore['overall_score']],
                                ]);
                            } else {
                                $q->orWhere([
                                    ['exam_id', $userMatchScore['exam_id']],
                                    ['score', '>=', $userMatchScore['overall_score']],
                                ]);
                            }
                        }
                    });

            $eligible = $institutionProgram->count() > 0;
        }

        return $eligible;
    }*/

    /**
     * @return bool
     */
    public function getIsScholarshipAttribute(): bool
    {
        return $this->checkScholarshipAvailable();
    }

    /**
     * @return bool
     */
    public function checkScholarshipAvailable(): bool
    {
        $programScholarships = $this->bonuses;
        $isScholarship       = false;
        if (filled($programScholarships)) {
            foreach ($programScholarships as $pscholarship) {
                if ($pscholarship->pivot->bonus_id && $pscholarship->pivot->bonus_id == 2) {
                    $isScholarship = true;
                    break;
                }
            }
        }

        return $isScholarship;
    }

    public function getIsWishlistAttribute()
    {
        return $this->checkWishlistItem($this);
    }

    public function checkWishlistItem($programCollection)
    {
        $wishlistItem = false;
        if (auth()->guard('web')->check()) {
            $wishlists =
                Wishlist::where([['user_id', auth()->id()], ['institution_program_id', $programCollection->id]])->first();
            if (filled($wishlists)) {
                $wishlistItem = true;
            }
        }
        return $wishlistItem;
    }

    public function getCurrenciesAttribute()
    {
        if (!empty(\Session::get('currency'))) {
            return \Session::get('currency')->symbol;
        } else {
            return defaultCurrency()->symbol;
        }
    }


    public function getCurrenciesIdAttribute()
    {
        if (!empty(\Session::get('currency'))) {
            return \Session::get('currency')->id;
        } else {
            return defaultCurrency()->id;
        }
    }

    public function getScholarshipAmountAttribute()
    {
        if (!empty(\Session::get('currency'))) {
            return number_format((\Session::get('currency')->usd_rate * $this->scholarship_usd), 2);
        } else {
            return number_format($this->scholarship_usd, 2);
        }
    }

    public function getFeesAmountAttribute()
    {
        if (!empty(\Session::get('currency'))) {
            return number_format((\Session::get('currency')->usd_rate * $this->tuition_fees_usd), 0);
        } else {
            return number_format($this->tuition_fees_usd, 0);
        }
    }

    public function getAmountToPayAttribute()
    {
        $topay = (float)$this->tuition_fees_usd - (float)$this->scholarship_usd;
        //dd($this->tuition_fees_usd,$this->scholarship_usd,$topay);
        if (!empty(\Session::get('currency'))) {
            return number_format((\Session::get('currency')->usd_rate * $topay), 0);
        } else {
            return number_format($topay, 0);
        }
    }

    public function getAmountToPayNewAttribute()
    {
        $topay = (float)$this->tuition_fees_usd - (float)$this->scholarship_usd;
        //dd($this->tuition_fees_usd,$this->scholarship_usd,$topay);
        if (!empty(\Session::get('currency'))) {
            return (\Session::get('currency')->usd_rate * $topay);
        } else {
            return $topay;
        }
    }

    public function unirep()
    {
        return $this->hasOne('App\Model\UniversityRepresentative', 'id', 'unirep_id');
    }

    public function bonuses()
    {
        return $this->belongsToMany('App\Model\Bonus', 'App\Model\InstitutionProgramBonus', 'institution_program_id', 'bonus_id');
    }

    /**
     * @return BelongsToMany
     */
    public function studyAreas(): BelongsToMany
    {
        return $this->belongsToMany(StudyArea::class, InstitutionProgramStudyArea::class, 'institution_program_id', 'study_area_id');
    }

    public function institution()
    {
        return $this->hasOne('App\Model\Institution', 'id', 'institution_id');
    }

    public function country()
    {
        return $this->hasOne('App\Model\Country', 'id', 'country_id');
    }

    public function state()
    {
        return $this->hasOne('App\Model\State', 'id', 'state_id');
    }

    public function city()
    {
        return $this->hasOne('App\Model\City', 'id', 'city_id');
    }

    public function currency()
    {
        return $this->hasOne('App\Model\Currency', 'id', 'currency_id');
    }

    public function studyType()
    {
        return $this->hasOne('App\Model\StudyType', 'id', 'study_type_id');
    }

    public function studyDuration()
    {
        return $this->hasOne('App\Model\StudyDuration', 'id', 'study_duration_id');
    }

    /**
     * @return HasOne
     */
    public function currentDegree(): HasOne
    {
        return $this->hasOne('App\Model\EducationLevel', 'id', 'current_degree_level_id');
    }

    /**
     * @return HasOne
     */
    public function degreeLevel(): HasOne
    {
        return $this->hasOne('App\Model\EducationLevel', 'id', 'degree_level_id');
    }

    public function language()
    {
        return $this->hasOne('App\Model\Language', 'id', 'language_id');
    }

    public function exam()
    {
        return $this->hasOne('App\Model\InstitutionProgramExamRequirement', 'institution_program_id', 'id');
    }

    public function ielts_exam()
    {
        return $this->hasOne(InstitutionProgramExamRequirement::class, 'institution_program_id', 'id')->with('ieltsExam');
    }

    public function program_ratings()
    {
        return $this->hasMany(ProgramRating::class, 'institution_program_id', 'id')->with('students');
    }

    public function exams()
    {
        return $this->hasMany('App\Model\InstitutionProgramExamRequirement', 'institution_program_id', 'id');
    }

    /**
     * @return HasMany
     */
    public function institutionProgramExamRequirements(): HasMany
    {
        return $this->hasMany(InstitutionProgramExamRequirement::class, 'institution_program_id', 'id');
    }

    public function deadlines()
    {
        return $this->hasMany('App\Model\InstitutionProgramDeadline', 'institution_program_id', 'id')
            ->with('session');
    }

    /**
     * @return HasMany
     */
    public function institutionProgramDeadlines(): HasMany
    {
        return $this->hasMany(InstitutionProgramDeadline::class, 'institution_program_id', 'id');
    }

    public function scopeActive($query)
    {
        if (auth()->check() && auth()->user()->is_unirep) {
            return $query;
        } else {
            return $query->where('is_active', 1);
        }
    }

    public function happyStudent()
    {
        return $this->hasMany('App\Model\Application', 'program_id')->where('status', 2);
    }

    public function application()
    {
        return $this->hasOne('App\Model\Application', 'program_id')->where('student_id', auth()->user()->id ?? null);
    }

    public function faqs()
    {
        return $this->hasMany('App\Model\FAQ\Faq', 'program_id', 'id');
    }

    public function eligibleStudents()
    {
        return User::with('studentEducation')
            ->where('status', '1')
            ->whereHas('studentEducation', function ($query) {
                $query->where('edu_country_id', $this->country_id)
                    ->where('edu_highest_level_id', $this->current_degree_level_id)
                    ->whereIn('study_area_id', $this->studyAreas->pluck('id')->toArray())
                    ->where(function ($sub) {
                        $i = 0;
                        foreach ($this->deadlines as $date) {
                            if ($i === 0) {
                                $sub->whereBetween('study_start_date', [$date->start_date, $date->last_date]);
                            } else {
                                $sub->orWhereBetween('study_start_date', [$date->start_date, $date->last_date]);
                            }
                            $i++;
                        }
                    });
            })
            ->whereHas('testScore', function ($query) {
                if (!empty($this->exam->exam_id)) {
                    $query->where('exam_id', $this->exam->exam_id)
                        ->where('overal_score', '>=', 'score');
                }

            });
    }

    public function isEligibility($user = null)
    {
        if ($user == null) {
            $user = auth()->user();
        }

        if (!$user || ($user && $user->is_unirep))
            return false;

        $student = $user->load(['studentEducation', 'testScore', 'testScores']);
        \DB::enableQueryLog();
        $institution_programs = self::addSelect('institution_programs.*')
            // ->join('institution_program_translations as ipt', function($join) {
            //     $join->on('ipt.institution_program_id',  'institution_programs.id')->where('ipt.locale', 'en');
            // })

            // ->join('institution_program_study_areas as ipsa', function($join) use ($student) {
            //     $join->on('ipsa.institution_program_id', 'institution_programs.id')
            //             ->whereIn('ipsa.study_area_id', $student->studentEducation->study_area_id);
            // })

            // ->join('institution_program_exam_requirements as iper', function($join) use ($student) {
            //     $join->on('iper.institution_program_id', 'institution_programs.id');
            //     if($student->testScores) {
            //         foreach($student->testScores as $testScoreIndex => $testScore) {

            //             if($testScoreIndex==0) {
            //                 $join->where(function($q) use($testScore){
            //                     $q->where('iper.exam_id', $testScore->exam_id)
            //                     ->where('iper.score', '<=', $testScore->overal_score);
            //                 });
            //             } else {
            //                 $join->orWhere(function($q) use($testScore){
            //                     $q->where('iper.exam_id', $testScore->exam_id)
            //                     ->where('iper.score', '<=', $testScore->overal_score);
            //                 });
            //             }

            //         }
            //     }
            // })

            ->join('institution_program_deadlines as ipd', function ($join) use ($student) {
                $study_start_season = $student->studentEducation->study_start_season ?? null;
                $study_start_year   = $student->studentEducation->study_start_year ?? null;

                $season_months = getStudySeasonsMonths($study_start_season);
                $season_months = "'" . implode(',', $season_months) . "'";
                $months_list   = json_encode(getAllMonths());
                //dd($study_start_season,$study_start_year,$season_months);
                $join->on('ipd.institution_program_id', 'institution_programs.id')
                    ->whereRaw("FIND_IN_SET( LOWER( monthname(str_to_date(CONCAT('" . $study_start_year
                               . "-',start_month,'-01'),'%Y-%m-%d')) ) , " . $season_months . ")")
                    //->whereRaw("FIND_IN_SET( LOWER( monthname(str_to_date(CONCAT('".$study_start_year."-',last_month,'-01'),'%Y-%m-%d')) ), ".$season_months.")");
                    ->whereRaw("last_month >=" . date('n'));
                //->whereRaw(' YEAR(now()) = ' . $study_start_year);
            })
            ->where('institution_programs.id', $this->id)
            // ->where('institution_programs.is_active', 1)
            // ->whereIn('institution_programs.country_id', $student->studentEducation->dest_country_id)
            // ->where('institution_programs.current_degree_level_id', $student->studentEducation->edu_highest_level_id)
            // ->where('institution_programs.gpa', '>=',$student->studentEducation->gpa_per)
            ->first();
        //dd($institution_programs);
        if ($institution_programs) {

            $msg = $institution_programs->id . 'institute program found';
            //\Log::info($msg);
            $englishTestScores  = $student->testScores()->whereHas('exam', function ($q) {
                return $q->where('type', 'english');
            })->get()->pluck('overal_score', 'exam_id')->toArray();
            $aptitudeTestScores = $student->testScores()->whereHas('exam', function ($q) {
                return $q->where('type', 'aptitude');
            })->get()->pluck('overal_score', 'exam_id')->toArray();

            $exam_scores = $institution_programs->exams;

            $program_english_scores  = $institution_programs->exams()->whereHas('examData', function ($q) {
                return $q->where('type', 'english');
            })->get();
            $program_aptitude_scores = $institution_programs->exams()->whereHas('examData', function ($q) {
                return $q->where('type', 'aptitude');
            })->get();

            $english_ip_score  = $program_english_scores->count() == 0
                ? true
                : false;
            $aptitude_ip_score = $program_aptitude_scores->count() == 0
                ? true
                : false;

            foreach ($exam_scores as $examIndex => $exam) {

                if ($exam->examData) {
                    if ($exam->examData->type == 'english' && isset($englishTestScores[$exam->exam_id])
                        && $exam->score <= $englishTestScores[$exam->exam_id]) {
                        $english_ip_score = true;
                    }
                    if ($exam->examData->type == 'aptitude' && isset($aptitudeTestScores[$exam->exam_id])
                        && $exam->score <= $aptitudeTestScores[$exam->exam_id]) {
                        $aptitude_ip_score = true;
                    }
                }
            }

            $is_eligibility = ($english_ip_score && $aptitude_ip_score)
                ? true
                : false;
            return $is_eligibility;
            // $is_eligibility = true;
        } else {
            $is_eligibility = false;
            return $is_eligibility;
        }

    }

    public function getEducationTitle($id)
    {
        return EducationLevel::where('id', $id)->get('title');
    }

    public function degree($id)
    {

        return InstitutionProgram::groupBy($id);
    }

    public function sameTypePrograms()
    {
        return $this->belongsToMany(StudyArea::class, 'institution_program_study_areas', 'study_area_id', 'institution_program_id');
    }

    /**
     * @return HasOne
     */
    public function title(): HasOne
    {
        return $this->hasOne(InstitutionProgramTranslation::class, 'institution_program_id', 'id');
    }

    /**
     * @return HasMany
     */
    public function institutionProgramTranslations(): HasMany
    {
        return $this->hasMany(InstitutionProgramTranslation::class, 'institution_program_id', 'id');
    }

    /**
     * @return HasOne
     */
    public function institutionProgramTranslation(): HasOne
    {
        return $this->hasOne(InstitutionProgramTranslation::class, 'institution_program_id', 'id');
    }

    /**
     * @param $query
     * @return Builder
     */
    public function scopeTitleSearch($query): Builder
    {
        return $query->whereHas('institutionProgramTranslations', function ($q) {
            return $q->where('title', 'like', '%' . request()->search . '%');
        });
    }

    /**
     * @return HasOne
     */
    public function matchRequirement(): HasOne
    {
        return $this->hasOne(MatchRequirement::class, 'education_level_id', 'current_degree_level_id');
    }


}

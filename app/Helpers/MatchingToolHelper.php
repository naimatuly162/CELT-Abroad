<?php

namespace App\Helpers;

use App\Model\MatchRequirement;
use App\Model\UserMatchScore;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Collection;

class MatchingToolHelper
{
    /**
     * @param null $user
     * @return bool
     */
    public static function storeMatchingToolsData($user = null): bool
    {
        $user = auth()->user ?? $user;

        if (!$user) {
            return false;
        }

        $matchRequirementSession = session()->get('match-requirements');
        $matchRequirement        = collect($matchRequirementSession)->except('user_test_score');

        MatchRequirement::query()->updateOrCreate(
            [
                'user_id' => $user->id
            ],
            $matchRequirement->toArray()
        );

        $userMatchScore = (new UserMatchScore())->query();
        $userMatchScore->where('user_id', $user->id)->delete();

        $userTestScores = collect($matchRequirementSession)->only('user_test_score');
        (collect($userTestScores->first() ?? []))->map(function ($userTestScore) use ($userMatchScore, $user) {
            $userTestScore['overall_score'] = $userTestScore['score'];
            $score                          = array_merge($userTestScore, ['user_id' => $user->id]);
            $userMatchScore->create($score);
        });

        session()->forget('match-requirements');

        return false;
    }

    /**
     * @return array
     */
    public static function getMatchingTool(): array
    {
        $match_requirement = $user_match_score = null;

        if (auth()->guard('web')->check()) {
            $user_match_score = UserMatchScore::query()
                ->where('user_id', auth()->id())
                ->where('overall_score', '!=', null)
                ->get(['exam_id', 'overall_score'])
                ->toArray();

            $match_requirement = MatchRequirement::query()
                ->where('user_id', auth()->id())
                ->first()
                ->toArray();
        } else {
            if (session()->has('match-requirements.user_test_score')) {
                $user_match_score = session()->get('match-requirements.user_test_score') ?? [];
            }

            if (session()->has('match-requirements')) {
                $match_requirement = session()->get('match-requirements');
            }
        }

        return [
            'match_requirement' => $match_requirement
                ?: [],
            'user_match_score'  => $user_match_score
                ?: [],
        ];
    }

    /**
     * @param $institutionProgram
     * @param bool $forAppend
     * @return bool|mixed
     */
    public static function eligiblePrograms($institutionProgram, bool $forAppend = false)
    {
        $eligible = false;

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
                    /*->with(['institutionProgramExamRequirements' => function ($q) use ($userMatchScores) {
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
                    }])*/
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

            $eligible = $forAppend && $institutionProgram->count() > 0;
        }

        return $forAppend
            ? $eligible
            : $institutionProgram;
    }
}

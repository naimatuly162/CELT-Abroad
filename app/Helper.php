<?php

use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

if (!function_exists('classActivePath')) {
    function classActivePath($segment, $value)
    {
        if (!is_array($value)) {
            return Request::segment($segment) == $value ? ' menu-open' : '';
        }
        foreach ($value as $v) {
            if (Request::segment($segment) == $v) return ' menu-open';
        }
        return '';
    }
}

if (!function_exists('classActiveSegment')) {
    function classActiveSegment($segment, $value)
    {
        if (!is_array($value)) {
            return Request::segment($segment) == $value ? 'active' : '';
        }
        foreach ($value as $v) {
            if (Request::segment($segment) == $v) return 'active';
        }
        return '';
    }
}

function defaultLanguage()
{
    $locale = App\Model\Locale::where('is_default', 1)->first();

    return $locale ? $locale->locale : '';
}

function defaultCurrency()
{
    $currency = App\Model\Currency::where('is_default', 1)->first();

    return $currency ? $currency : '';
}

if (!function_exists('uploadFile')) {
    /**
     * Get the upload file.
     *
     * @param string $path
     * @return string
     */
    function uploadFile($file, $dir, $resize_width = 100, $resize_height = 100)
    {

        if ($file) {
            $destinationPath = storage_path('app/public') . DIRECTORY_SEPARATOR . $dir . DIRECTORY_SEPARATOR;
            $media_image     = $file->hashName();
            $newPhotoName    = time() . '_' . $media_image;
            $img             = Image::make($file->path());

            $img->resize($resize_width, $resize_height, function ($constraint) {
                $constraint->aspectRatio();
            });
            $file->move($destinationPath, $newPhotoName);
            return $newPhotoName;
        }


//        if ($file) {
//
//            $destinationPath = storage_path('app/public') . DIRECTORY_SEPARATOR . $dir . DIRECTORY_SEPARATOR;
//
//            $media_image = $file->hashName();
//            $imageName = str_replace(' ', '', pathinfo($media_image, PATHINFO_FILENAME));
//            $newPhotoName = time() . '_' . $imageName . '.webp';
//            //dd($destinationPath);
//            $webp = Webp::make($file);
//
//            if ($dir == "student") {
//                /* $img = Image::make($file->path());
//                $img->resize(100, 100, function ($constraint) {
//                    $constraint->aspectRatio();
//                });
//                $file->move($destinationPath, $media_image);  */
//                $webp->save($destinationPath . $newPhotoName);
//            } else {
//                // $file->move($destinationPath, $media_image);
//                $webp->save($destinationPath . $newPhotoName);
//            }
//            return $newPhotoName;
//        }
    }
}
function checkFile($file, $dir, $default = 'default.jpg')
{
    $image = $file;
    if ($file != null && strpos($file, '/') > 0) {
        $image = explode('/', $file);
        $image = array_pop($image);
    }

    $path = $dir . '/' . $image;

    if (Storage::disk('public')->exists($path) && $file != null) {
        return asset('storage/' . $path);
    }
    return asset('images/' . $default);
}

function uploadDropzoneFile($file, $dir)
{
    if ($file) {

        // dd($file);
        $destinationPath = storage_path('app/public') . DIRECTORY_SEPARATOR . $dir . DIRECTORY_SEPARATOR;
        $media_image     = $file->hashName();
        $imageName       = str_replace(' ', '', pathinfo($media_image, PATHINFO_FILENAME));
        $newPhotoName    = time() . '_' . $media_image;
        $img             = Image::make($file->path());
        // dd($img);
        //$webp = Buglinjo\LaravelWebp\Facades\Webp::make($file);

        //$webp->save($destinationPath . $newPhotoName);
        $img->resize(880, 250, function ($constraint) {
            $constraint->aspectRatio();
        });
        $file->move($destinationPath, $newPhotoName);


        return $newPhotoName;
    }
}

function getCountry()
{
    //return countries order by high priority of university
    $countries = App\Model\Country::with(['institute', 'translation'])
        ->withCount('institute')
        ->orderBy('institute_count', 'desc');
    // ->get();
    return $countries;
}

function _getError($rule, $key)
{
    return str_replace(':attribute', trans($key), trans('validation.' . $rule));
}

function usdCovert($defaultCurrency, $value)
{
    $currencies = App\Model\Currency::where('id', $defaultCurrency)->first();
    return (float)$currencies->usd_rate * $value;
}

function usdReverceCovert($defaultCurrency, $value)
{
    $currencies = App\Model\Currency::where('id', $defaultCurrency)->first();
    return $value / (float)$currencies->usd_rate;
}

function universityLikes()
{
    $university_likes = "";

    if (auth()->user()) {
        $university_likes = App\Model\StudentFavoriteUniversity::where('student_id', auth()->user()->id)->get();
    }

    return $university_likes;
}

function programLikes()
{
    $program_likes = "";

    if (auth()->user()) {
        $program_likes = App\Model\StudentFavoriteProgram::where('student_id', auth()->user()->id)->get();
    }

    return $program_likes;
}


function getYoutubeEmbedUrl($url)
{
    $shortUrlRegex = '/youtu.be\/([a-zA-Z0-9_]+)\??/i';
    $longUrlRegex  = '/youtube.com\/((?:embed)|(?:watch))((?:\?v\=)|(?:\/))(\w+)/i';

    if (preg_match($longUrlRegex, $url, $matches)) {
        $youtube_id = $matches[count($matches) - 1];
    }

    if (preg_match($shortUrlRegex, $url, $matches)) {
        $youtube_id = $matches[count($matches) - 1];
    }
    return $youtube_id ?? '';
}

function paginate($items, $perPage = 4, $page = null, $options = [])
{
    $page      = $page ?: (Paginator::resolveCurrentPage() ?: 1);
    $items     = $items instanceof Collection ? $items : Collection::make($items);
    $paginator = new LengthAwarePaginator($items->forPage($page, $perPage), $items->count(), $perPage, $page, $options);

    $url = \Request::url();
    $paginator->setPath($url);

    return $paginator;
}

function listMonth()
{
    $months = [];
    for ($m = 1; $m <= 12; $m++) {
        $months[] = date('F', mktime(0, 0, 0, $m, 1, date('Y')));
    }
    return $months;
}

function listDate($month)
{
    $dates = [];

    for ($d = 1; $d <= 31; $d++) {
        $time = mktime(12, 0, 0, $month, $d);
        if (date('m', $time) == $month)
            $dates[] = date('d', $time);
    }

    return $dates;
}

function studySeasons()
{
    return [
        'spring', //- march, april, may
        'summer', //- june, july, august
        'autumn', //- september, october, november
        'winter', //- december, january, february
    ];
}

function getStudySeasonsMonths($season)
{
    $season_months = [
        'spring' => ['march', 'april', 'may'],
        'summer' => ['june', 'july', 'august'],
        'autumn' => ['september', 'october', 'november'],
        'winter' => ['december', 'january', 'february'],
    ];
    return isset($season_months[$season]) ? $season_months[$season] : [];
}

function getAllMonths()
{
    return ["-", "january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"];
}

function ifNotExist($table, $column)
{
//    if (Schema::hasColumn($table, $column)) {
//        return false;
//    }
}

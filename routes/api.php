<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['namespace' => 'Api'], function () {

	// Localization
	Route::get('/js/lang.js', function () {
		// $strings = Cache::rememberForever('lang.js', function () {
		$lang = config('app.locale');
		$files   = glob(resource_path('lang/' . $lang . '{,*/,*/*/,*/*/*/}*.php'), GLOB_BRACE);
		$strings = [];


		foreach ($files as $file) {
			$name           = basename($file, '.php');
			$strings[$name] = require $file;
		}

		// return $strings;
		// });
		header('Content-Type: text/javascript');
		return ('window.i18n = ' . json_encode($strings) . ';');
		exit();
	})->name('assets.lang');

	Route::group(['prefix' => 'validation', 'as' => 'validation.'], function () {
		Route::post('unique', 'ValidationController@unique')->name('unique');
		Route::post('exists', 'ValidationController@exists')->name('exists');
	});

	Route::group(['as' => 'users.'], function () {

        Route::get('/abc', function (){
            return 12;
        });
		Route::post('register', 'UserAuthController@register');
		Route::post('login', 'UserAuthController@login');
		Route::post('reset-password', 'UserAuthController@sendResetLinkEmail');


		Route::middleware(['auth:api'])->group(function () {
			Route::post('verify-otp', 'UserAuthController@verify');
			Route::get('resend-otp', 'UserAuthController@resendOtp');
		});
	});
});

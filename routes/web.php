<?php

use Laravel\Socialite\Facades\Socialite;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


#design_tuly........route ..//

Route::get('rep-institute', 'Front\UniversityController@institute')->name('rep.institute');
Route::get('/application', 'Front\UniversityController@application')->name('application');

Route::get('/application/{status?}', 'Front\UniversityController@application')->name('application');



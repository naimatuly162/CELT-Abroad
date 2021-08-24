<?php

return [

    'defaults' => [
        'guard' => 'web',
        'passwords' => 'users',
    ],

    'guards' => [
        'web' => [
            'driver' => 'session',
            'provider' => 'users',  // student/user 
        ],

        'api' => [
            'driver' => 'passport',
            'provider' => 'users',
            'hash' => false,
        ],

        'admin' =>[
            'driver' => 'session',
            'provider' => 'admins'
        ],

        'unirep' =>[
            'driver' => 'session',
            'provider' => 'unireps' //University Representative
        ],

        // 'student' => [
        //     'driver' => 'session',
        //     'provider' => 'students'
        // ],
    ],

    'providers' => [
        'users' => [
            'driver' => 'eloquent',
            'model' =>  App\Model\User::class,
        ],

        'admins' => [
            'driver' => 'eloquent',
            'model' =>  App\Model\Admin::class,
        ],

        // 'students' => [
        //     'driver' => 'eloquent',
        //     'model' =>  App\Student::class,
        // ],

        'unireps' => [
            'driver' => 'eloquent',
            'model' =>  App\Model\UniversityRepresentative::class,
        ]
    ],

    'passwords' => [
        'users' => [
            'provider' => 'users',
            'table' => 'password_resets',
            'expire' => 60,
            'throttle' => 60,
        ],

        'admins' => [
            'provider' => 'admins',
            'table' => 'password_resets',
            'expire' => 60,
            'throttle' => 60,
        ],

        'unireps' => [
            'provider' => 'unireps',
            'table' => 'password_resets',
            'expire' => 60,
            'throttle' => 60,
        ],
    ],

    'password_timeout' => 10800,

];

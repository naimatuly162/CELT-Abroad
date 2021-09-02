<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="google-signin-client_id"
          content="662561312805-a4j1tnut5kcah2a3mb6eequbkprasl1p.apps.googleusercontent.com">
    <title>{{ config('app.name') }} - @yield('page-title', 'Welcome')</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="shortcut icon" href="{{ asset('images/favicon/favicon-16x16.png')}}">
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
</head>

<body>
@include('front.rep_new_design.layout.nav')

@yield('content')
@include('front.rep_new_design.layout.footer')

{{--@include('layout.footer')--}}

<script src="{{ asset('js/app.js') }}" type="text/javascript"></script>
<script>
    let base_url = "{{ config('app.url') }}";
</script>
@stack('js')
</body>


</html>

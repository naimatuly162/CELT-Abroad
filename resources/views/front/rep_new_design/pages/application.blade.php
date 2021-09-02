@extends('front.rep_new_design.app')

@section('content')
    <!-- Background image -->
    <div class="p-5 text-center bg-image mask">
        <div class="d-flex justify-content-center align-items-center h-100">
            <div class="text-white justify-content-center align-items-center">
                <h1 class="mb-3">Applications</h1>
            </div>
        </div>
    </div>
    <!-- Background image -->
    <div class="navbar nav-bottom navbar-light bg-light">

        <div class="container">
            <div class="col-lg-3">
                <div class="navbar nav-bottom ">
                    <div class="navbar-brand">
                        <form class="form">
                            <div class="switch-field">
                                <input type="radio" id="switch_left" name="switch_2" value="yes" checked/>
                                <label for="switch_left">Recent</label>
                                <input type="radio" id="switch_right" name="switch_2" value="no"/>
                                <label for="switch_right">Old</label>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class=" col-lg-6">
                <ul class="nav nav-middle nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link" href="#">All(20)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{route('application',  'pending')}}">Pending(5)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{route('application',  'approve')}}">Approved(2)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{route('application', 'rejected')}}">Rejected(5)</a>
                    </li>
                </ul>

            </div>


            <div class="col-lg-3 button-filter">
                <form class="d-flex input-group w-auto" >
                   <button type="button" class="btn btn-outline-primary dropdown-toggle" data-toggle="collapse" data-target="#dropdown"> <img src="{{asset('images/filter/Vector.svg')}}"
                       />Filter</button>
                </form>
            </div>
            <div class="col-lg-4">
                    <div id="dropdown" class="collapse" >
                                <h6>Filter by Program:</h6>
                                <div class="dropdown">
                                    <button class="btn btn-outline-primary dropdown-toggle" type="button" data-toggle="dropdown">Art and Design
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">HTML</a></li>
                                        <li><a href="#">CSS</a></li>
                                        <li><a href="#">Art and Design</a></li>
                                    </ul>
                        </div>
                    </div>
            </div>

        </div>
    </div>

    @include('front.rep_new_design.components.allapplication')

@endsection

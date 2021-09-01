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
                        <a class="nav-link" href="#"><span>All(20)</span></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="{{route('application', $status='pending')}}">Pending(5)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{route('application', $status='approve')}}">Approved(2)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{route('application', $status='rejected')}}">Rejected(5)</a>
                    </li>

                </ul>
            </div>

            <div class="col-lg-3">
                <form class="d-flex input-group w-auto">
                    <input
                        type="search"
                        class="form-control rounded"
                        placeholder="Search"
                        aria-label="Search"
                        aria-describedby="search-addon"
                    />
                    <span class="input-group-text border-0" id="search-addon">
                <i class="fas fa-search"></i>
                </span>
                </form>
            </div>

        </div>
    </div>
@include('front.rep_new_design.components.allapplication')

@endsection

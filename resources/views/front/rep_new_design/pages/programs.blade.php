
@extends('front.rep_new_design.app')

@section('content')

    <!-- Background image -->
    <div class="p-5 text-center bg-image mask">
        <div class="d-flex justify-content-center align-items-center h-100">
            <div class="text-white justify-content-center align-items-center">
                <h1 class="mb-3">Programs</h1>
                <a class="btn btn-outline-light btn-lg " href="#" role="button"
                ><i class="fas fa-plus"></i>Add Programs</a
                >
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
                        <a class="nav-link" href="#">Pending(5)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Approved(2)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Rejected(5)</a>
                    </li>
                </ul>
            </div>
            <div class="col-lg-3 button-filter">
                <form class="d-flex input-group w-auto" >
                    <button type="button" class="btn btn-outline-primary dropdown-toggle" data-toggle="collapse" data-target="#dropdown"> <img src="{{asset('images/filter/Vector.svg')}}"
                        />Filter</button>
                </form>
            </div>

                {{--            card-body--}}

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

            <div class="container">
                <div class="panel panel-default">
                    <div class="panel-body">
                <div class="col-lg-4">
                        <img src="{{asset('images/Frame-230.svg')}}" class="card-img-bottom" alt="...">
                    </div>
                <div class="col-lg-8">
                    <div class="card-body card-content">
                        <div class="card-header">
                            <h5 class="card-title">Masters of virtual Reality</h5>
                            <h6 class="card-subtitle mb-2 text-muted">Duke University</h6>
                            <ul class="list-group list-group-horizontal d-flex justify-content-start">
                                <li class="list-item">Bsc</li>
                                <li class="list-item">Full-time</li>
                                <li class="list-item">3 years</li>
                            </ul>
                        </div>
                            <h6><b>Jane Cooper</b></h6>
                                <ul>
                                <li class="list-item">London,UK</li>
                                <li class="list-item">IELTS:07</li>
                                <li class="list-item">Highest Education
                                    <ul>
                                        <li class="list-item2">High School</li>
                                        <li class="list-item2">Average grade:75%</li>
                                    </ul>
                                </li>
                                </ul>
                             </div>

                         </div>
                     </div>
                     </div>
                    </div>

                </div>
            </div>

@endsection

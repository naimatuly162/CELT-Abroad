@extends('front.rep_new_design.app')

@section('content')
    <!-- Background image -->
    <div class="p-5 text-center bg-image mask">
        <div class="d-flex justify-content-center align-items-center h-100">
            <div class="text-white justify-content-center align-items-center">
                <h1 class="mb-3">Institutes</h1>
                <a class="btn btn-outline-light btn-lg " href="{{route('add-institute')}}" role="button"
                ><i class="fas fa-plus"></i>Add Institute</a
                >
            </div>
        </div>
    </div>
    <!-- Background image -->

    <div class="navbar nav-bottom navbar-light bg-light">
        <div class="container" style="border-bottom: 1px solid rgba(30, 57, 143, 0.1);">
            <div class="navbar nav-bottom justify-content-around">
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
            <div class="col-lg-8 d-flex justify-content-end">
            <form class="d-flex input-group input-search ">
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
            <div class="button-filter">
                <form class="d-flex input-group w-auto" >
                    <button type="button" onclick="filter()" class="btn btn-outline-primary"> <img src="{{asset('images/filter/Vector.svg')}}"
                        />Filter</button>
                </form>
            </div>
            </div>
        </div>
    </div>
    <div class="navbar panel-bottom nav-bottom navbar-light bg-light" style=" margin-bottom: 32px;">
    <div class="container d-flex justify-content-end">
        <div class="navbar panel-default nav-bottom">
            <div class="input-group" id="inputGroupSelect02">
                <h6>Filter by Program: </h6>
                <select class="custom-select" >
                    <option selected></option>
                    <option value="1">USA</option>
                    <option value="2">CANADA</option>
                    <option value="3">UK</option>
                </select>
            </div>
        </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="container">
            <div class="row">

                <div class="col-md-4 col-sm-6">
                    <div class="card">
                        <img src="{{asset('images/image_13.png')}}" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-logo">
                                <img src="{{asset('images/harverd.svg')}}" class="card-img-bottom" alt="...">
                            </div>
                            <h5 class="card-title">Harvard University</h5>
                            <h6 class="card-text">
                                Cambridge,MA,USA
                            </h6>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item"><i class="fa fa-user"></i>Total Student (52)</li>
                                <li class="list-group-item"><i class="fa fa-file"></i>Total Dicipline (08)</li>
                            </ul>
                            <div class="d-flex justify-content-around">
                                <button href="#" class="btn btn-default"><i class="fa fa-edit"></i>Edit</button>
                                <button href="#" class="btn btn-default"><i class="fa fa-copy"></i>Duplicate</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6">
                    <div class="card">
                        <img src="{{asset('images/image_13.png')}}" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-logo">
                                <img src="{{asset('images/harverd.svg')}}" class="card-img-bottom" alt="...">
                            </div>
                            <h5 class="card-title">Harvard University</h5>
                            <h6 class="card-text">
                                Cambridge,MA,USA
                            </h6>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item"><i class="fa fa-user"></i>Total Student (52)</li>
                                <li class="list-group-item"><i class="fa fa-file"></i>Total Dicipline (08)</li>
                            </ul>
                            <div class="d-flex justify-content-around">
                                <button href="#" class="btn btn-default"><i class="fa fa-edit"></i>Edit</button>
                                <button href="#" class="btn btn-default"><i class="fa fa-copy"></i>Duplicate</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6">
                    <div class="card">
                        <img src="{{asset('images/image_13.png')}}" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-logo">
                                <img src="{{asset('images/harverd.svg')}}" class="card-img-bottom" alt="...">
                            </div>
                            <h5 class="card-title">Harvard University</h5>
                            <h6 class="card-text">
                                Cambridge,MA,USA
                            </h6>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item"><i class="fa fa-user"></i>Total Student (52)</li>
                                <li class="list-group-item"><i class="fa fa-file"></i>Total Dicipline (08)</li>
                            </ul>
                            <div class="d-flex justify-content-around">
                                <button href="#" class="btn btn-default"><i class="fa fa-edit"></i>Edit</button>
                                <button href="#" class="btn btn-default"><i class="fa fa-copy"></i>Duplicate</button>
                            </div>
                        </div>
                    </div>
                </div>

                {{---------new-card-style----------}}

            </div>
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <script>
        function filter() {

            var x = document.getElementById("inputGroupSelect02");

            if (x.style.display === "none") {
                x.style.display = "flex";

            } else {
                x.style.display = "none";
            }
        }
    </script>

@endsection


@extends('front.rep_new_design.app')

@section('content')
<div class="container-fluid">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-6">
                <div class="card">
                    <img  src="{{asset('images/image_13.png')}}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <div class="card-logo">
                        <img src="{{asset('images/harverd.svg')}}"  class="card-img-bottom" alt="...">
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
                    <img  src="{{asset('images/image_13.png')}}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <div class="card-logo">
                            <img src="{{asset('images/harverd.svg')}}"  class="card-img-bottom" alt="...">
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
                    <img  src="{{asset('images/image_13.png')}}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <div class="card-logo">
                            <img src="{{asset('images/harverd.svg')}}"  class="card-img-bottom" alt="...">
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

@endsection


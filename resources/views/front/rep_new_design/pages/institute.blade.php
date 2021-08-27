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
                    {{---------new-card-style----------}}

            <div class="col-md-4 col-sm-6">
                <div class="card">
                    <div class="card-header">
                    <h5 class="card-title">Masters of virtual Reality</h5>
                    <h6 class="card-subtitle mb-2 text-muted">Duke University</h6>


                    <ul class="list-group list-group-horizontal d-flex justify-content-around">
                        <li class="list-item">Bsc</li>
                        <li class="list-item">Full-time</li>
                        <li class="list-item">3 years</li>
                    </ul>
                    </div>

                        <div class="card-body card-content">
                            <div class="col-md-4">
                            <img src="{{asset('images/Frame-230.svg')}}" class="card-img-bottom" alt="...">
                                <button type="button" class="btn btn-primary btn-message"><i class="fa fa-paper-plane"></i>Message</button>
                            </div>
                            <div class="col-md-8">
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
                    <div class="d-flex justify-content-around" style="padding: 15px">
                        <button type="button" class="btn btn-warning">Bonus</button>
                        <button type="button" class="btn btn-success">Approve</button>
                        <button type="button" class="btn btn-danger">Reject</button>
                    </div>
                    </div>
                </div>

            <div class="col-md-4 col-sm-6">
                <div class="card">
                    <h5 class="card-title">Masters of virtual Reality</h5>
                    <h6 class="card-subtitle mb-2 text-muted">Duke University</h6>

                    <ul class="list-group list-group-horizontal d-flex justify-content-around">
                        <li class="list-item">Bsc</li>
                        <li class="list-item">Full-time</li>
                        <li class="list-item">3 years</li>
                    </ul>
                    <div class="card-body card-content">
                        <div class="col-md-4">
                            <img src="{{asset('images/Frame-230.svg')}}" class="card-img-bottom" alt="...">
                            <button type="button" class="btn btn-primary btn-message"><i class="fa fa-paper-plane"></i>Message</button>
                        </div>
                        <div class="col-md-8">
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
                    <div class="d-flex justify-content-around" style="padding: 15px">
                        <button type="button" class="btn btn-warning">Bonus</button>
                        <button type="button" class="btn btn-success">Approve</button>
                        <button type="button" class="btn btn-danger">Reject</button>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="card">
                    <div class="card-nav"></div>
                    <h5 class="card-title">Masters of virtual Reality</h5>
                    <h6 class="card-subtitle mb-2 text-muted">Duke University</h6>
                    <ul class="list-group list-group-horizontal d-flex justify-content-around">
                        <li class="list-item">Bsc</li>
                        <li class="list-item">Full-time</li>
                        <li class="list-item">3 years</li>
                    </ul>
                    <div class="card-body card-content">
                        <div class="col-md-4">
                            <img src="{{asset('images/Frame-230.svg')}}" class="card-img-bottom" alt="...">
                            <button type="button" class="btn btn-primary btn-message"><i class="fa fa-paper-plane"></i>Message</button>
                        </div>
                        <div class="col-md-8">
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
                    <div class="d-flex justify-content-around" style="padding: 15px">
                        <button type="button" class="btn btn-warning">Bonus</button>
                        <button type="button" class="btn btn-success">Approve</button>
                        <button type="button" class="btn btn-danger">Reject</button>
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


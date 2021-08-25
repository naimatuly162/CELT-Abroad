@extends('front.rep_new_design.app')

@section('content')
<div class="container-fluid">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-6">
                <div class="card" style="width: 18rem;">
                    <img  src="{{asset('images/image_13.png')}}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Harvard University</h5>
                        <h6 class="card-text">
                            Cambridge,MA,USA
                        </h6>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><i class="fa fa-user"></i>Total Student (52)</li>
                        <li class="list-group-item"><i class="fa fa-file"></i>Total Dicipline (08)</li>
                    </ul>
                    <div class="card-body">
                        <button href="#" class="btn btn-default"><i class="fa fa-edit"></i>Edit</button>
                        <button href="#" class="btn btn-default"><i class="fa fa-copy"></i>Duplicate</button>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">An item</li>
                        <li class="list-group-item">A second item</li>
                        <li class="list-group-item">A third item</li>
                    </ul>
                    <div class="card-body">
                        <a href="#" class="card-link">Card link</a>
                        <a href="#" class="card-link">Another link</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">An item</li>
                        <li class="list-group-item">A second item</li>
                        <li class="list-group-item">A third item</li>
                    </ul>
                    <div class="card-body">
                        <a href="#" class="card-link">Card link</a>
                        <a href="#" class="card-link">Another link</a>
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


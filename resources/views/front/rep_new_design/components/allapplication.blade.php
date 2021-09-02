
<div class="container-fluid">
    <div class="container">
        <div class="row">
            @for($i=0; $i<12; $i++ )
            <div class="col-md-4 col-sm-6">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title">Masters of virtual Reality</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Duke University</h6>
                        <ul class="list-group list-group-horizontal d-flex justify-content-start">
                            <li class="list-item">Bsc</li>
                            <li class="list-item">Full-time</li>
                            <li class="list-item">3 years</li>
                        </ul>
                    </div>
                    <div class="card-body card-content">
                        <div class="col-md-4">
                            <img src="{{asset('images/Frame-230.svg')}}" class="card-img-bottom" alt="...">
                            <button type="button" class="btn btn-primary btn-message"><i class="fa fa-paper-plane"></i>Message
                            </button>
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
                    @php
                    $view = $status ?? 'pending';
                    @endphp
                 @include('front.rep_new_design.button.'.$view )
                </div>
            </div>
            @endfor
        </div>
    </div>
</div>


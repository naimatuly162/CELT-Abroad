

@extends('front.rep_new_design.app')

@section('content')

    <!-- Background image -->
    <div class="p-5 text-center bg-image mask">
        <div class="d-flex justify-content-center align-items-center h-100">
            <div class="text-white justify-content-center align-items-center">
                <h1 class="mb-3">Add Institute</h1>
            </div>
        </div>
    </div>
    <!-- Background image -->

    <div class="container-fluid">
        <div class="container">
            <div class="row">

                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h6>Institute Cover Photo</h6>
                                </div>
                                <div class="card-block">
                                    <form action="#" class="dropzone dz-clickable">
                                        <div class="form-group">
                                            <div class="dz-default dz-message"><span>Drop files here to upload</span></div>
                                        </div>
                                    </form>
                                </div>
                                </div>

                            <form>
                            <div class="form-group">
                                <label for="inputAddress">Institute Name</label>
                                <input type="text" class="form-control" id="inputAddress" placeholder="Write Institute name">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputName">Institute Name</label>
                                    <select id="inputName" class="form-control">
                                        <option selected>Select...</option>
                                        <option>...</option>
                                    </select>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Number of Faculty</label>
                                    <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
                                </div>
                            </div>
                                <p>Location--------</p>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputName">Country</label>
                                        <select id="inputName" class="form-control">
                                            <option selected>Select...</option>
                                            <option>...</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputName">State/Province</label>
                                        <select id="inputName" class="form-control">
                                            <option selected>Select...</option>
                                            <option>...</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputName">City</label>
                                        <select id="inputName" class="form-control">
                                            <option selected>Select...</option>
                                            <option>Uttara</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Zip/Postal Code</label>
                                        <input type="text" class="form-control" id="inputPassword4" placeholder="Write Zip/Postal Code">
                                    </div>
                                </div>

                                <p>Ranking----------</p>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">QS Ranking</label>
                                        <input type="text" class="form-control" id="inputPassword4" placeholder="QS Ranking">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">World Ranking</label>
                                        <input type="text" class="form-control" id="inputPassword4" placeholder="World Ranking">
                                    </div>
                                </div>




                    <div class="form-group">
                        <label for="inputAddress2">Address 2</label>
                        <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputCity">City</label>
                            <input type="text" class="form-control" id="inputCity">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="inputState">State</label>
                            <select id="inputState" class="form-control">
                                <option selected>Choose...</option>
                                <option>...</option>
                            </select>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="inputZip">Zip</label>
                            <input type="text" class="form-control" id="inputZip">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="gridCheck">
                            <label class="form-check-label" for="gridCheck">
                                Check me out
                            </label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Sign in</button>
                </form>
                </div>
            </div>
        </div>
    </div>



@endsection

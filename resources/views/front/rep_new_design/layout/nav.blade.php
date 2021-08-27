<header>
    <!-- Navbar -->
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="navbar nav-m navbar-expand-lg navbar-light bg-light">
                    <!-- Toggle button -->
                    <button
                        class="navbar-toggler"
                        type="button"
                        data-mdb-toggle="collapse"
                        data-mdb-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                    >
                        <i class="fas fa-bars"></i>
                    </button>
                    <!-- Collapsible wrapper -->
                    <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
                        <!-- Navbar brand -->
                        <a class="navbar-brand btn-m mt-2 mt-lg-0" href="#">CELT<span> Abroad</span>
                        </a>
                        <!-- Left links -->
                        <ul class="navbar-nav nav-middle me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="#"><span>Institutes</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Programs</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Applications</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Students</a>
                            </li>
                        </ul>
                        <!-- Left links -->

                        <!-- Right elements -->
                        <div class="d-flex right-nav align-items-center">
                            <!-- Icon -->
                            <!-- Notifications -->
                            <a
                                class="text-reset me-3 dropdown-toggle hidden-arrow"
                                href="#"
                                id="navbarDropdownMenuLink"
                                role="button"
                                data-mdb-toggle="dropdown"
                                aria-expanded="false"
                            >
                                <i class="fa fa-bell"></i>
{{--                                <span class="badge rounded-pill badge-notification bg-danger">1</span>--}}
                            </a>
                            <!-- Avatar -->
                            <a
                                class="dropdown-toggle d-flex align-items-center hidden-arrow"
                                href="#"
                                id="navbarDropdownMenuLink"
                                role="button"
                                data-mdb-toggle="dropdown"
                                aria-expanded="false"
                            >
                                <img
                                    src="https://mdbootstrap.com/img/new/avatars/2.jpg"
                                    class="rounded-circle"
                                    height="25"
                                    alt=""
                                    loading="lazy"
                                />
                            </a>
                        </div>
                        <!-- Right elements -->
                    </div>
                    <!-- Collapsible wrapper -->
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar -->
    <!-- Background image -->
    <div class="p-5 text-center bg-image mask">
            <div class="d-flex justify-content-center align-items-center h-100">
                <div class="text-white justify-content-center align-items-center">
                    <h1 class="mb-3">Institutes</h1>
                    <a class="btn btn-outline-light btn-lg " href="#" role="button"
                    ><i class="fas fa-plus"></i>Add Institute</a
                    >
            </div>
        </div>
    </div>
    <!-- Background image -->

    <div class="navbar nav-bottom navbar-light bg-light">
        <div class="container">
            <div class="navbar nav-bottom justify-content-around">
            <div class="navbar-brand">
                <form class="form">
                    <div class="switch-field">
                        <input type="radio" id="switch_left" name="switch_2" value="yes" checked/>
                        <label for="switch_left">Recent</label>
                        <input type="radio" id="switch_right" name="switch_2" value="no" />
                        <label for="switch_right">Old</label>
                    </div>
                </form>
            </div>
            </div>
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
</header>

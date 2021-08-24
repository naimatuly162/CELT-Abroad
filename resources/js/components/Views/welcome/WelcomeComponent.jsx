import React, { Component } from "react";

export default class App extends Component {
    render() {
        return (
            <React.Fragment>
                <div className="main-content">
                    <section className="spacepadding featured-categorie">
                        <div className="container">
                            <div className="row">
                                <div className="col-12">
                                    <div className="title-section text-center mb-4">
                                        <span className="polygon-part polygon-blue">
                                            <i className="fas fa-graduation-cap"></i>
                                        </span>
                                        <h4>Featured Categories</h4>
                                        <p>
                                            It is a long established fact that a
                                            reader will be distracted by the
                                            readable content of a page when
                                            looking at its layout. The point of
                                            using Lorem Ipsum.
                                        </p>
                                    </div>
                                    <div className="fc-tab">
                                        <ul
                                            className="nav nav-pills mb-3 justify-content-center mb-5"
                                            id="pills-tab"
                                            role="tablist"
                                        >
                                            <li className="nav-item">
                                                <a
                                                    className="nav-link active"
                                                    id="pills-scholarships-tab"
                                                    data-toggle="pill"
                                                    href="#pills-scholarships"
                                                    role="tab"
                                                    aria-controls="pills-scholarships"
                                                    aria-selected="true"
                                                >
                                                    Scholarships
                                                </a>
                                            </li>
                                            <li className="nav-item">
                                                <a
                                                    className="nav-link"
                                                    id="pills-programs-tab"
                                                    data-toggle="pill"
                                                    href="#pills-programs"
                                                    role="tab"
                                                    aria-controls="pills-programs"
                                                    aria-selected="false"
                                                >
                                                    Programs
                                                </a>
                                            </li>
                                            <li className="nav-item">
                                                <a
                                                    className="nav-link"
                                                    id="pills-universities-tab"
                                                    data-toggle="pill"
                                                    href="#pills-universities"
                                                    role="tab"
                                                    aria-controls="pills-universities"
                                                    aria-selected="false"
                                                >
                                                    Universities
                                                </a>
                                            </li>
                                            <li className="nav-item">
                                                <a
                                                    className="nav-link"
                                                    id="pills-student-tab"
                                                    data-toggle="pill"
                                                    href="#pills-student"
                                                    role="tab"
                                                    aria-controls="pills-student"
                                                    aria-selected="false"
                                                >
                                                    Students
                                                </a>
                                            </li>
                                        </ul>
                                        <div
                                            className="tab-content"
                                            id="pills-tabContent"
                                        ></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </React.Fragment>
        );
    }
}

import React from "react";

const InnerBanner = props => (
    <div className="banner-bg banner-gradient-bg user-details-banner">
        <div
            className="pg-tp-bg"
            style={{ backgroundImage: "url('images/student.jpg')" }}
        ></div>
        <div className="page-title-shape">
            <svg
                version="1.1"
                id="Layer_2"
                xmlns="http://www.w3.org/2000/svg"
                xmlnsXlink="http://www.w3.org/1999/xlink"
                x="0px"
                y="0px"
                viewBox="0 0 2200 114.5"
                enableBackground="new 0 0 2200 114.5"
                xmlSpace="preserve"
            >
                <path
                    fill="#fff"
                    d="M0,0L0,0c725.8,128.6,1460.1,129.4,2186.1,2.4L2200,0v114.5H0V0z"
                ></path>
            </svg>
        </div>
        <div className="left-shape"></div>
        <div className="container">
            <div className="row">
                <div className="col-12 ml-auto">
                    <div className="page-title-area">
                        <div className="container">
                            <div className="page-title-content text-center">
                                <h2>{props.title}</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
);

export default InnerBanner;

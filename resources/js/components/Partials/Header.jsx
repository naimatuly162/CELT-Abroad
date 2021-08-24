import React, { Component } from "react";
import { HomeBanner } from "./HomeBanner";
import InnerBanner from "./InnerBanner";
import { trans } from "../Localization";
import AppContext from "../Context/AppState";
import { NavLink } from "react-router-dom";

class Header extends Component {
    logOut() {
        const empty_session = {
            isLoggedIn: false,
            isVerified: false,
            user: {}
        };

        localStorage["appState"] = JSON.stringify(empty_session);
        this.context.setAppState(empty_session);
    }

    render() {
        return (
            <AppContext.Consumer>
                {context => (
                    <React.Fragment>
                        <header className="header-wrapper">
                            <div className="container">
                                <div className="header-part d-flex align-items-center">
                                    <div className="logo-part">
                                        <NavLink to="/">
                                            <img
                                                src="images/logo.png"
                                                className="img-fluid"
                                                alt=""
                                            />
                                        </NavLink>
                                    </div>

                                    <div className="menu-part ml-auto">
                                        <a
                                            href=""
                                            className="close-menu d-block d-lg-none"
                                        >
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                viewBox="0 0 320 512"
                                            >
                                                <path
                                                    fill="#00207e"
                                                    d="M193.94 256L296.5 153.44l21.15-21.15c3.12-3.12 3.12-8.19 0-11.31l-22.63-22.63c-3.12-3.12-8.19-3.12-11.31 0L160 222.06 36.29 98.34c-3.12-3.12-8.19-3.12-11.31 0L2.34 120.97c-3.12 3.12-3.12 8.19 0 11.31L126.06 256 2.34 379.71c-3.12 3.12-3.12 8.19 0 11.31l22.63 22.63c3.12 3.12 8.19 3.12 11.31 0L160 289.94 262.56 392.5l21.15 21.15c3.12 3.12 8.19 3.12 11.31 0l22.63-22.63c3.12-3.12 3.12-8.19 0-11.31L193.94 256z"
                                                    className=""
                                                ></path>
                                            </svg>
                                        </a>
                                        <nav className="nav-bar">
                                            <ul className="d-lg-flex">
                                                <li>
                                                    <a
                                                        href=""
                                                        className="active"
                                                    >
                                                        {trans(
                                                            "header.programs"
                                                        )}
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="universities.html">
                                                        {trans(
                                                            "header.universities"
                                                        )}
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="scholarship.html">
                                                        {trans(
                                                            "header.scholarships"
                                                        )}
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="country.html">
                                                        {trans(
                                                            "header.countries"
                                                        )}
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="blog.html">
                                                        {trans("header.blog")}
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <div className="d-flex align-items-center ml-xl-5 ml-lg-2 ml-auto">
                                        <ul className="account-right">
                                            {context.AppState.isLoggedIn ==
                                                false && (
                                                <li className="d-xl-block">
                                                    <a
                                                        href=""
                                                        data-toggle="modal"
                                                        data-target="#login-modal"
                                                        data-dismiss="modal"
                                                    >
                                                        {trans("header.login")}
                                                    </a>
                                                </li>
                                            )}
                                            {context.AppState.isLoggedIn && (
                                                <li>
                                                    <div className="dropdown">
                                                        <button
                                                            className="dropdown-toggle myprofile-link"
                                                            type="button"
                                                            id="dropdownMenuMyprofile"
                                                            data-toggle="dropdown"
                                                            aria-haspopup="true"
                                                            aria-expanded="false"
                                                        >
                                                            <i className="fas fa-user mr-0 mr-sm-1"></i>
                                                            <span>
                                                                <em>
                                                                    {trans(
                                                                        "header.my_profile"
                                                                    )}
                                                                </em>
                                                                <i className="fas fa-chevron-down align-middle"></i>
                                                            </span>
                                                        </button>
                                                        <div
                                                            className="dropdown-menu dropdown-menu-right p-0"
                                                            aria-labelledby="dropdownMenuMyprofile"
                                                        >
                                                            <a
                                                                className="dropdown-item"
                                                                href="student-programs.html"
                                                            >
                                                                {trans(
                                                                    "header.my_program"
                                                                )}
                                                            </a>
                                                            <NavLink
                                                                className="dropdown-item"
                                                                activeClassName="active"
                                                                to="/profile"
                                                            >
                                                                {trans(
                                                                    "header.profile"
                                                                )}
                                                            </NavLink>
                                                            <a
                                                                className="dropdown-item"
                                                                href="setting.html"
                                                            >
                                                                {trans(
                                                                    "header.setting"
                                                                )}
                                                            </a>
                                                            <a
                                                                className="dropdown-item"
                                                                onClick={this.logOut.bind(
                                                                    this
                                                                )}
                                                            >
                                                                {trans(
                                                                    "header.logout"
                                                                )}
                                                            </a>
                                                        </div>
                                                    </div>
                                                </li>
                                            )}
                                        </ul>
                                        <div className="lung-drp dropdown">
                                            <button
                                                className="dropdown-toggle"
                                                type="button"
                                                id="dropdownMenuButton"
                                                data-toggle="dropdown"
                                                aria-haspopup="true"
                                                aria-expanded="false"
                                            >
                                                <img
                                                    src="images/us-flag.jpg"
                                                    className="shadow"
                                                    alt="image"
                                                />
                                                <span>
                                                    <em>Eng</em>
                                                    <i className="fas fa-chevron-down align-middle"></i>
                                                </span>
                                            </button>
                                            <div
                                                className="dropdown-menu dropdown-menu-right"
                                                aria-labelledby="dropdownMenuButton"
                                            >
                                                <a
                                                    className="dropdown-item"
                                                    href=""
                                                >
                                                    <img
                                                        src="images/us-flag.jpg"
                                                        className="img-fluid mr-1"
                                                        alt="English"
                                                    />
                                                    <span>English</span>
                                                </a>
                                                <a
                                                    className="dropdown-item"
                                                    href=""
                                                >
                                                    <img
                                                        src="images/tr-flag.jpg"
                                                        className="img-fluid mr-1"
                                                        alt="Turkey"
                                                    />
                                                    <span>Turkey</span>
                                                </a>
                                                <a
                                                    className="dropdown-item"
                                                    href=""
                                                >
                                                    <img
                                                        src="images/ru-flag.jpg"
                                                        className="img-fluid mr-1"
                                                        alt="Russian"
                                                    />
                                                    <span>Russian</span>
                                                </a>
                                                <a
                                                    className="dropdown-item"
                                                    href=""
                                                >
                                                    <img
                                                        src="images/az-flag.jpg"
                                                        className="img-fluid mr-1"
                                                        alt="Azerbaijani"
                                                    />
                                                    <span>Azerbaijani</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="toggle-btn d-lg-none">
                                        <a href="">
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </header>
                        {this.props.banner == "home" ? (
                            <HomeBanner />
                        ) : (
                            <InnerBanner title={this.props.bannerTitle} />
                        )}
                    </React.Fragment>
                )}
            </AppContext.Consumer>
        );
    }
}

Header.contextType = AppContext;

export default Header;

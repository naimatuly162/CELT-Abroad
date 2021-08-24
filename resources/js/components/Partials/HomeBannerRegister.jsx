import React, { Component } from "react";
import Register from "./Register";
import VerifyOtp from "./VerifyOtp";
import AppContext from "../Context/AppState";

class HomeBannerRegister extends Component {
    constructor(props, context) {
        super(props);
    }

    render() {
        return (
            <AppContext.Consumer>
                {context => (
                    <div className="home-bannerInner">
                        <div className="container">
                            <div className="row">
                                <div className="col-xl-5 col-lg-6 col-md-8 ml-auto">
                                    {!context.AppState.isLoggedIn && (
                                        <Register />
                                    )}

                                    {context.AppState.isLoggedIn &&
                                        !context.AppState.isVerified && (
                                            <VerifyOtp />
                                        )}
                                </div>
                            </div>
                        </div>
                    </div>
                )}
            </AppContext.Consumer>
        );
    }
}

HomeBannerRegister.contextType = AppContext;

export default HomeBannerRegister;

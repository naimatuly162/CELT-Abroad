import React, { Component } from "react";
import Header from "../Partials/Header";
import Login from "../Partials/Login";
import StudentForgotPassword from "../Partials/StudentForgotPassword";
import AppStateContext from "../Context/AppState";

export default class Main extends Component {
    render() {
        return (
            <AppStateContext.Consumer>
                {context => (
                    <React.Fragment>
                        <Header
                            banner={
                                this.props.currentRoute == "/"
                                    ? "home"
                                    : "inner"
                            }
                            bannerTitle={this.props.bannerTitle}
                        />
                        <React.Fragment>{this.props.children}</React.Fragment>

                        {!context.AppState.isLoggedIn && <Login />}
                        {!context.AppState.isLoggedIn && (
                            <StudentForgotPassword />
                        )}
                    </React.Fragment>
                )}
            </AppStateContext.Consumer>
        );
    }
}

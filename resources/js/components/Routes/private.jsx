import React from "react";
import { Route, Redirect, withRouter } from "react-router";
import Main from "../Layouts/Main";

const PrivateRoute = ({ component: Component, path, Auth, ...rest }) => (
    <Route
        path={path}
        {...rest}
        render={props =>
            Auth.isLoggedIn ? (
                <Main currentRoute={rest.path}>
                    <Component {...props} />
                </Main>
            ) : (
                <Redirect
                    to={{
                        pathname: "/",
                        state: {
                            prevLocation: path,
                            showLoginPopup: true,
                            error: "You need to login first!"
                        }
                    }}
                />
            )
        }
    />
);

export default withRouter(PrivateRoute);

import React from "react";
import { Route, Redirect, withRouter } from "react-router";
import Main from "../Layouts/Main";

const VerifyRoute = ({ component: Component, path, Auth, ...rest }) => (
    <Route
        path={path}
        {...rest}
        render={props =>
            Auth.isLoggedIn && Auth.isVerified ? (
                <Main currentRoute={rest.path} bannerTitle={rest.bannerTitle}>
                    <Component {...props} />
                </Main>
            ) : (
                <Redirect
                    to={{
                        pathname: "/",
                        state: {
                            prevLocation: path,
                            error: "You need to verify account first!"
                        }
                    }}
                />
            )
        }
    />
);

export default withRouter(VerifyRoute);

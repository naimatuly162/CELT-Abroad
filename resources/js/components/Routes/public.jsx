import React from "react";
import { Route } from "react-router";
import Main from "../Layouts/Main";

const PublicRoute = ({ component: Component, Auth, ...rest }) => (
    <Route
        {...rest}
        render={props => (
            <Main currentRoute={rest.path}>
                <Component {...props} />
            </Main>
        )}
    />
);

export default PublicRoute;

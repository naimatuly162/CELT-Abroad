import React, { useState } from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

import routes from "./routes";
import PublicRoute from "./public";
import PrivateRoute from "./private";
import VerifyRoute from "./verify";
import AppStateContext from "../Context/AppState";

let state_of_state = localStorage["appState"];
if (!state_of_state) {
    let appState = {
        isLoggedIn: false,
        isVerified: false,
        user: {}
    };
    localStorage["appState"] = JSON.stringify(appState);
}

let default_locale = localStorage["celt_locale"];
if (!default_locale) {
    localStorage["celt_locale"] = window.default_locale;
    default_locale = window.default_locale;
}

let state = localStorage["appState"];
let AppState = JSON.parse(state);

const Auth = {
    isLoggedIn: AppState.isLoggedIn,
    isVerified: AppState.isVerified,
    user: AppState.user
};

const Routes = () => {
    const [_Auth, _setAuth] = useState(Auth);
    const [_AppLocale, _setAppLocale] = useState(default_locale);
    return (
        <AppStateContext.Provider
            value={{
                AppState: _Auth,
                AppLocale: _AppLocale,
                setAppState: _setAuth,
                setAppLocale: _setAppLocale
            }}
        >
            <Router>
                <Switch>
                    {routes.map((route, i) => {
                        if (route.auth) {
                            if (route.verify) {
                                return (
                                    <VerifyRoute
                                        Auth={Auth}
                                        key={i}
                                        {...route}
                                    />
                                );
                            } else {
                                return (
                                    <PrivateRoute
                                        Auth={Auth}
                                        key={i}
                                        {...route}
                                    />
                                );
                            }
                        } else {
                            return (
                                <PublicRoute Auth={Auth} key={i} {...route} />
                            );
                        }
                    })}
                </Switch>
            </Router>
        </AppStateContext.Provider>
    );
};

export default Routes;

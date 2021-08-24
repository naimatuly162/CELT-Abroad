import React, { Component } from "react";
import ReactDOM from "react-dom";
import Routes from "./Routes";

export default class App extends Component {
    render() {
        return (
            <React.Fragment>
                <Routes />
            </React.Fragment>
        );
    }

    componentDidMount() {
        let loader = document.getElementById("master_loader");
        setTimeout(() => {
            loader.classList.add("d-none");
        }, 200);
    }
}

if (document.getElementById("app")) {
    ReactDOM.render(<App />, document.getElementById("app"));
}

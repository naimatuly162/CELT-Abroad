import React, { Component } from "react";

export default class Flash extends Component {
    constructor(props) {
        super(props);

        this.state = {
            visibility: false,
            message: "",
            type: ""
        };

        this.showFlash = this.showFlash.bind(this);
    }

    showFlash(type, message) {
        this.setState({
            visibility: true,
            type,
            message
        });

        setTimeout(() => {
            this.setState({
                visibility: false,
                type: "",
                message: ""
            });
        }, 5000);
    }

    render() {
        return (
            this.state.visibility && (
                <div className={`alert alert-${this.state.type}`}>
                    <p>{this.state.message}</p>
                </div>
            )
        );
    }
}

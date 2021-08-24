import React, { Component } from "react";
import { verifyOTP, resendOTP } from "../Services/Auth/Register";
import Flash from "../Flash";
import AppContext from "../Context/AppState";

class VerifyOtp extends Component {
    constructor(props) {
        super(props);

        this.state = {
            otp: "",
            isVerifying: false,
            isResending: false
        };

        this.showFlashRef = React.createRef();

        this.handleChange = this.handleChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
        this.resendOtp = this.resendOtp.bind(this);
    }

    resendOtp() {
        this.setState({
            isResending: true
        });

        resendOTP()
            .then(res => {
                this.showFlashRef.current.showFlash("success", res.message);
            })
            .catch(err => {
                this.showFlashRef.current.showFlash("danger", err.message);
            })
            .finally(() =>
                this.setState({
                    isResending: false
                })
            );
    }

    handleChange(event) {
        event.preventDefault();
        if (event.target.value) {
            this.setState({
                otp: event.target.value
            });
        }
    }

    handleSubmit(event) {
        event.preventDefault();
        this.setState({
            isVerifying: true
        });

        verifyOTP(this.state.otp)
            .then(res => {
                let state = localStorage["appState"];
                let AppState = JSON.parse(state);
                AppState.user.isVerified = true;
                const session = {
                    isLoggedIn: AppState.isLoggedIn,
                    isVerified: res.data.match,
                    user: AppState.user
                };

                localStorage["appState"] = JSON.stringify(session);
                this.showFlashRef.current.showFlash("success", res.message);
                this.context.setAppState(session);
            })
            .catch(err =>
                this.showFlashRef.current.showFlash("danger", err.message)
            )
            .finally(() =>
                this.setState({
                    isVerifying: false
                })
            );
    }

    render() {
        return (
            <div className="home-form-part position-relative home-form-step2 active-step2">
                <div className="home-form-icon">
                    <img src="images/college-icon.png" alt="" />
                </div>
                <div className="home-form-title text-center">
                    <p>
                        Enter OTP to get in the moment updates on the things
                        that interest you.
                    </p>
                </div>
                <Flash ref={this.showFlashRef} />
                <form onSubmit={this.handleSubmit}>
                    <div className="form-group">
                        <input
                            type="text"
                            name="otp"
                            id="otp"
                            required
                            placeholder="Enter OTP"
                            className="form-control"
                            onChange={this.handleChange}
                        />
                    </div>
                    <div className="form-group">
                        <input
                            type="submit"
                            value={
                                this.state.isVerifying
                                    ? "Verifying..."
                                    : "Submit"
                            }
                            className="btn-theme btn-theme-orange w-100 submit-otp"
                            disabled={
                                this.state.otp.length > 0 &&
                                !this.state.isVerifying
                                    ? false
                                    : true
                            }
                        />
                    </div>
                    <button
                        className="btn-theme btn-theme-orange w-100"
                        disabled={this.state.isResending}
                        onClick={this.resendOtp}
                    >
                        {this.state.isResending ? "Resending..." : "Resend Otp"}
                    </button>
                </form>
            </div>
        );
    }
}

VerifyOtp.contextType = AppContext;

export default VerifyOtp;

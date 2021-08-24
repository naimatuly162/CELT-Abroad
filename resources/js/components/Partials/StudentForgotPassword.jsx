import React, { Component } from "react";
import ReeValidate from "../Validator";
import { sendResetPasswordLinkEmail } from "../Services/Auth/ForgotPassword";
import FlashMessage from "../Flash";

class StudentForgotPassword extends Component {
    constructor(props) {
        super(props);

        this.showFlash = React.createRef();

        this.validator = new ReeValidate({
            email: "required|email"
        });

        this.state = {
            isLoading: false,
            formData: {
                email: ""
            },
            errors: this.validator.errors
        };

        this.handleChange = this.handleChange.bind(this);
        this.handleValidationAndSubmit = this.handleValidationAndSubmit.bind(
            this
        );
    }

    handleChange(event) {
        const name = event.target.name;
        const value = event.target.value;
        const { errors } = this.validator;

        this.setState({
            formData: { ...this.state.formData, [name]: value }
        });

        this.validator.validate(name, value).then(() => {
            this.setState({ errors });
        });
    }

    sendResetPasswordLink() {
        sendResetPasswordLinkEmail(this.state.formData)
            .then(res => {
                this.showFlash.current.showFlash("success", res.message);
            })
            .catch(err => {
                let { errors } = this.validator;

                Object.keys(err.errors).forEach(field => {
                    errors.add({
                        field: field,
                        msg: err.errors[field]
                    });
                });

                this.showFlash.current.showFlash("danger", err.message);

                this.setState({ errors });
            })
            .finally(() => {
                this.setState({
                    isLoading: false
                });
            });
    }

    async handleValidationAndSubmit(event) {
        event.preventDefault();

        const { errors } = this.validator;

        this.validator.validateAll(this.state.formData).then(success => {
            if (success) {
                this.setState({ isLoading: true });
                this.sendResetPasswordLink();
            } else {
                this.setState({ isLoading: false });
                this.setState({ errors });
            }
        });
    }

    render() {
        const errors = this.state.errors;
        return (
            <div
                className="modal fade"
                id="forgotpassword-modal"
                tabIndex="-1"
                role="dialog"
                aria-hidden="true"
                data-backdrop="static"
                data-keyboard="false"
            >
                <div
                    className="modal-dialog modal-dialog-centered login-modal-size"
                    role="document"
                >
                    <div className="modal-content">
                        <div className="modal-body modal-pd-0">
                            <div className="modal-mix-box">
                                <button
                                    type="button"
                                    className="close"
                                    data-dismiss="modal"
                                    aria-label="Close"
                                >
                                    <i className="fa fa-times"></i>
                                </button>
                                <div className="modal-text-box">
                                    <div className="page-ath-header text-center">
                                        <a href="/" className="page-ath-logo">
                                            <img
                                                src="images/logo-blue.png"
                                                alt="logo"
                                            />
                                        </a>
                                    </div>
                                    <div className="page-ath-form">
                                        <h2 className="page-ath-heading mb-0 text-center">
                                            Forgot Password
                                        </h2>
                                        <span>
                                            Enter the email address you used to
                                            sign up and we'll send you a link to
                                            reset your password.
                                        </span>
                                        <FlashMessage ref={this.showFlash} />
                                        <form
                                            onSubmit={
                                                this.handleValidationAndSubmit
                                            }
                                            className="mt-4"
                                        >
                                            <div className="input-item">
                                                <input
                                                    name="email"
                                                    type="email"
                                                    placeholder="Your Email"
                                                    className={
                                                        "form-control input-bordered" +
                                                        (errors.has("email")
                                                            ? " is-invalid"
                                                            : "")
                                                    }
                                                    onChange={this.handleChange}
                                                />
                                                <div className="invalid-feedback">
                                                    {errors.first("email")}
                                                </div>
                                            </div>
                                            <button className="btn btn-primary btn-block">
                                                Submit
                                            </button>
                                        </form>
                                        <div className="form-note mt-3">
                                            Remember Password?
                                            <a
                                                data-toggle="modal"
                                                data-target="#login-modal"
                                                data-dismiss="modal"
                                            >
                                                <strong>Login here</strong>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

export default StudentForgotPassword;

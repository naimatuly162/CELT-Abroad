import React, { Component } from "react";
import Validator from "../Validator";
import UserLoginService from "../Services/Auth/Login";
import Flash from "../Flash";
import AppContext from "../Context/AppState";

class Login extends Component {
    constructor(props) {
        super(props);

        this.showFlash = React.createRef();

        this.validator = new Validator({
            type: "required",
            email: "required|email",
            password: "required"
        });

        this.state = {
            isLoading: false,
            formData: {
                type: "unirep",
                email: "",
                password: ""
            },
            errors: this.validator.errors
        };

        this.handleInput = this.handleInput.bind(this);
        this.handleValidateAndSubmit = this.handleValidateAndSubmit.bind(this);
    }

    userLogin() {
        console.log('sdfs')
        UserLoginService({
            email: this.state.formData.email,
            password: this.state.formData.password
        })
            .then(res => {
                const session = {
                    isLoggedIn: true,
                    user: res.data.user,
                    isVerified: res.data.user.isVerified
                };

                localStorage.setItem("appState", JSON.stringify(session));
                this.context.setAppState(session);
                document.getElementsByClassName("modal-backdrop")[0].remove();
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
            .finally(() => this.setState({ isLoading: false }));
    }

    unirepLogin() {
        alert("unirep");
    }

    async handleValidateAndSubmit(event) {
        event.preventDefault();

        const { formData } = this.state;
        const { errors } = this.validator;

        this.validator.validateAll(formData).then(success => {
            if (success) {
                this.setState({ isLoading: true });
                this.state.formData.type == "unirep"
                    ? this.unirepLogin()
                    : this.userLogin();
            } else {
                this.setState({ isLoading: false });
                this.setState({ errors });
            }
        });
    }

    handleInput(event) {
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

    render() {
        let { errors } = this.state;

        return (
            <div
                className="modal fade"
                id="login-modal"
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
                                        <a
                                            href="index.html"
                                            className="page-ath-logo"
                                        >
                                            <img
                                                src="images/logo-blue.png"
                                                alt="logo"
                                            />
                                        </a>
                                    </div>
                                    <div className="page-ath-form">
                                        <h2 className="page-ath-heading">
                                            Login
                                            <small>
                                                with your Celt Abroad Account
                                            </small>
                                        </h2>
                                        <div className="account-tab">
                                            <ul className="d-flex mb-3">
                                                <li className="nav-item">
                                                    <input
                                                        type="radio"
                                                        name="type"
                                                        value="unirep"
                                                        id="modalunirep"
                                                        checked={
                                                            this.state.formData
                                                                .type ==
                                                            "unirep"
                                                        }
                                                        onChange={
                                                            this.handleInput
                                                        }
                                                    />
                                                    <label htmlFor="modalunirep">
                                                        University
                                                    </label>
                                                </li>
                                                <li className="nav-item">
                                                    <input
                                                        type="radio"
                                                        name="type"
                                                        value="student"
                                                        id="modalstudent"
                                                        checked={
                                                            this.state.formData
                                                                .type ==
                                                            "student"
                                                        }
                                                        onChange={
                                                            this.handleInput
                                                        }
                                                    />
                                                    <label htmlFor="modalstudent">
                                                        Student
                                                    </label>
                                                </li>
                                            </ul>
                                            <div
                                                id="unirep"
                                                className="modalAccountPart"
                                                style={{ display: "block" }}
                                            >
                                                <Flash ref={this.showFlash} />
                                                <form
                                                    noValidate
                                                    onSubmit={
                                                        this
                                                            .handleValidateAndSubmit
                                                    }
                                                >
                                                    <div className="input-item">
                                                        <input
                                                            name="email"
                                                            type="text"
                                                            placeholder="Your Email"
                                                            className={
                                                                "input-bordered form-control " +
                                                                (errors.has(
                                                                    "email"
                                                                )
                                                                    ? " is-invalid"
                                                                    : "")
                                                            }
                                                            onChange={
                                                                this.handleInput
                                                            }
                                                        />
                                                        <span className="invalid-feedback">
                                                            {errors.first(
                                                                "email"
                                                            )}
                                                        </span>
                                                    </div>
                                                    <div className="input-item">
                                                        <input
                                                            name="password"
                                                            type="password"
                                                            placeholder="Password"
                                                            className={
                                                                "input-bordered form-control " +
                                                                (errors.has(
                                                                    "password"
                                                                )
                                                                    ? " is-invalid"
                                                                    : "")
                                                            }
                                                            onChange={
                                                                this.handleInput
                                                            }
                                                        />
                                                        <span className="invalid-feedback">
                                                            {errors.first(
                                                                "password"
                                                            )}
                                                        </span>
                                                    </div>
                                                    <button
                                                        className="btn btn-primary btn-block"
                                                        disabled={
                                                            this.state.isLoading
                                                        }
                                                    >
                                                        {this.state.isLoading
                                                            ? "Logging You In"
                                                            : "Login"}
                                                    </button>
                                                    <div className="d-flex justify-content-between align-items-start">
                                                        <div className="input-item text-left"></div>
                                                        <div>
                                                            <a
                                                                href=""
                                                                data-toggle="modal"
                                                                data-target="#forgotpassword-modal"
                                                                data-dismiss="modal"
                                                            >
                                                                Forgot password?
                                                            </a>
                                                            <div className="gaps-2x"></div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
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

Login.contextType = AppContext;

export default Login;

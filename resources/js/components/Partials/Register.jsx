import React, { Component } from "react";
import ReeValidate from "../Validator";
import { register } from "../Services/Auth/Register";
import Flash from "../Flash";
import { trans } from "../Localization";
import AppContext from "../Context/AppState";
import Http from "../Services/Http";

class Register extends Component {
    constructor(props) {
        super(props);

        this.showFlash = React.createRef();

        const dictionary = {
            en: {
                attributes: {
                    first_name: trans("home_banner.firstname"),
                    last_name: trans("home_banner.lastname"),
                    email: trans("home_banner.email")
                }
            }
        };

        this.validator = new ReeValidate({
            first_name: "required|alpha_spaces",
            last_name: "required|alpha_spaces",
            email: "required|email",
            password: "required|min:8"
        });

        this.validator.localize(dictionary);

        this.state = {
            formData: {
                first_name: "",
                last_name: "",
                email: "",
                password: ""
            },
            errors: this.validator.errors,
            isLoading: false
        };

        this.handleSubmit = this.handleSubmit.bind(this);
        this.handleInput = this.handleInput.bind(this);
        this.handleEmail = this.handleEmail.bind(this);
        this.register = this.register.bind(this);
    }

    register() {
        register(this.state.formData)
            .then(res => {
                const session = {
                    isLoggedIn: true,
                    user: res.data.user,
                    isVerified: res.data.user.isVerified
                };

                localStorage.setItem("appState", JSON.stringify(session));
                this.context.setAppState(session);
                Http.defaults.headers.common[
                    "Authorization"
                ] = `Bearer ${session.user.token}`;
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

                this.setState({ isLoading: false });
                this.setState({ errors });
            });
    }

    async handleSubmit(event) {
        event.preventDefault();

        const { formData } = this.state;
        const { errors } = this.validator;

        this.validator.validateAll(formData).then(success => {
            if (success) {
                this.setState({ isLoading: true });
                this.register();
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

    handleEmail(event) {
        const { errors } = this.validator;

        this.setState({
            formData: { ...this.state.formData, email: event.target.value }
        });

        this.validator.validate("email", event.target.value).then(() => {
            this.setState({ errors });
        });
    }

    render() {
        let { errors } = this.state;

        return (
            <div className="home-form-part position-relative home-form-step1">
                <div className="home-form-icon">
                    <img src="images/college-icon.png" alt="" />
                </div>
                <div className="home-form-title text-center">
                    <p>{trans("home_banner.title1")}</p>
                    <h2>{trans("home_banner.title2")}</h2>
                </div>
                <Flash ref={this.showFlash} />
                <form onSubmit={this.handleSubmit} noValidate>
                    <div className="form-group">
                        <input
                            type="text"
                            name="first_name"
                            id="first_name"
                            placeholder={trans("home_banner.firstname")}
                            className={
                                "form-control" +
                                (errors.has("first_name") ? " is-invalid" : "")
                            }
                            onChange={this.handleInput}
                        />
                        <div className="invalid-feedback">
                            {errors.first("first_name")}
                        </div>
                    </div>
                    <div className="form-group">
                        <input
                            type="text"
                            name="last_name"
                            id="last_name"
                            placeholder={trans("home_banner.lastname")}
                            className={
                                "form-control" +
                                (errors.has("last_name") ? " is-invalid" : "")
                            }
                            onChange={this.handleInput}
                        />
                        <div className="invalid-feedback">
                            {errors.first("last_name")}
                        </div>
                    </div>
                    <div className="form-group">
                        <input
                            type="email"
                            name="email"
                            id="email"
                            placeholder={trans("home_banner.email")}
                            className={
                                "form-control" +
                                (errors.has("email") ? " is-invalid" : "")
                            }
                            onChange={this.handleEmail}
                        />
                        <div className="invalid-feedback">
                            {errors.first("email")}
                        </div>
                    </div>
                    <div className="form-group">
                        <input
                            type="password"
                            name="password"
                            id="password"
                            placeholder="Password"
                            className={
                                "form-control" +
                                (errors.has("password") ? " is-invalid" : "")
                            }
                            onChange={this.handleInput}
                        />
                        <div className="invalid-feedback">
                            {errors.first("password")}
                        </div>
                    </div>
                    <div className="form-group">
                        <input
                            type="submit"
                            disabled={this.state.isLoading}
                            value={
                                this.state.isLoading == false
                                    ? "continue"
                                    : "sending OTP"
                            }
                            className="btn-theme btn-theme-orange w-100"
                        />
                    </div>
                </form>
            </div>
        );
    }
}

Register.contextType = AppContext;

export default Register;

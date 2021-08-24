import React, { Component } from "react";
import { trans } from "../../Localization";

class PersionalInformationConponent extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div
                className={
                    "tab-pane " + (this.props.step == 1 ? " active" : " hidden")
                }
                id="tab1"
            >
                <div className="stud-row">
                    <div className="stud-title mt-4">
                        <h3>{trans("student_profile.personal_information")}</h3>
                    </div>
                    <div className="row">
                        <div className="col-md-12">
                            <div className="form-group">
                                <div className="upload-btn-wrapper text-center">
                                    <div className="user-passprot-file">
                                        <input
                                            type="file"
                                            id="profile-img"
                                            name="user[image]"
                                            required
                                        />
                                        <img
                                            src="images/profile.png"
                                            id="profile-img-tag"
                                            alt=""
                                        />
                                        <div className="img-edit-view">
                                            <i className="fas fa-user-edit edit-icon"></i>
                                        </div>
                                    </div>
                                </div>
                                <label className="d-block text-center mb-4">
                                    ({trans("student_profile.image_notice")})
                                </label>
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.full_name"
                                    )}
                                    *
                                </label>
                                <input
                                    type="text"
                                    className="form-control"
                                    name="user[full_name]"
                                    defaultValue="{{ $user->full_name ?? '' }}"
                                    placeholder={trans(
                                        "student_profile.form.placeholder.full_name"
                                    )}
                                    required
                                />
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.title_name"
                                    )}
                                    *
                                </label>
                                <input
                                    type="text"
                                    className="form-control"
                                    name="user[title_name]"
                                    defaultValue="{{ $user->title_name ?? '' }}"
                                    placeholder={trans(
                                        "student_profile.form.placeholder.title_name"
                                    )}
                                    required
                                />
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans("student_profile.form.title.email")}*
                                </label>
                                <input
                                    type="text"
                                    className="form-control"
                                    name="user[email]"
                                    defaultValue="{{ $user->email ?? '' }}"
                                    placeholder={trans(
                                        "student_profile.form.placeholder.email"
                                    )}
                                    required
                                />
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans("student_profile.form.title.phone")}*
                                </label>
                                <input
                                    type="text"
                                    className="form-control"
                                    name="user[phone]"
                                    defaultValue="{{ $user->phone ?? '' }}"
                                    placeholder={trans(
                                        "student_profile.form.placeholder.phone"
                                    )}
                                    required
                                />
                            </div>
                        </div>
                    </div>
                    <div className="stud-title mt-4">
                        <h3>{trans("student_profile.residental_address")}</h3>
                    </div>
                    <div className="row">
                        <div className="col-md-12">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.address"
                                    )}
                                    *
                                </label>
                                <textarea
                                    placeholder="Enter Residental Address here ..."
                                    className="form-control"
                                    name="user[address]"
                                    rows="3"
                                    required
                                ></textarea>
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.country"
                                    )}
                                    *
                                </label>
                                <div className="selectPart w-100">
                                    <select
                                        className="select2-single form-control customSelect {{ $errors->has('country') ? 'is-invalid' : '' }}"
                                        name="user[country]"
                                        id="country"
                                        required
                                    >
                                        <option value="">Select Country</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans("student_profile.form.title.state")}*
                                </label>
                                <div className="selectPart w-100">
                                    <select
                                        name="user[state]"
                                        className="customSelect form-control {{ $errors->has('state') ? 'is-invalid' : '' }}"
                                        id="state"
                                        required
                                    >
                                        <option value="">Select State</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans("student_profile.form.title.city")}*
                                </label>
                                <div className="selectPart w-100">
                                    <select
                                        name="user[city]"
                                        className="customSelect form-control {{ $errors->has('city') ? 'is-invalid' : '' }}"
                                        id="city"
                                        required
                                    >
                                        <option value="">Select City</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.zipcode"
                                    )}
                                    *
                                </label>
                                <input
                                    type="text"
                                    className="form-control"
                                    name="user[zipcode]"
                                    defaultValue="{{ $user->zipcode ?? '' }}"
                                    placeholder={trans(
                                        "student_profile.form.placeholder.zipcode"
                                    )}
                                    required
                                />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

export default PersionalInformationConponent;

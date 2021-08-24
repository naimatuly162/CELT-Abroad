import React, { Component } from "react";
import { trans } from "../../Localization";

class EducationSummaryComponent extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div
                className={
                    "tab-pane" + (this.props.step == 2 ? " active" : " hidden")
                }
                id="tab2"
            >
                <div className="stud-row">
                    <div className="stud-title mt-4">
                        <h3>{trans("student_profile.education_summary")}</h3>
                    </div>
                    <div className="row">
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.country_of_edu"
                                    )}
                                    *
                                </label>
                                <div className="selectPart w-100">
                                    <select
                                        className="customSelect form-control"
                                        name="education[edu_country_id]"
                                        required
                                    >
                                        <option value="">
                                            Select Education Country
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.highest_level_of_edu"
                                    )}
                                    *
                                </label>
                                <div className="selectPart w-100">
                                    <select
                                        className="customSelect form-control"
                                        name="education[edu_highest_level_id]"
                                        required
                                    >
                                        <option value="">
                                            Select Education Level
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.grade_avg"
                                    )}
                                    *
                                </label>
                                <input
                                    type="text"
                                    className="form-control"
                                    name="education[edu_grade_average]"
                                    placeholder={trans(
                                        "student_profile.form.placeholder.grade_average"
                                    )}
                                    required
                                />
                            </div>
                        </div>
                        <div className="col-lg-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.grading_scheme"
                                    )}
                                    *
                                </label>
                                <div className="selectPart w-100">
                                    <select
                                        className="customSelect form-control"
                                        name="education[edu_grade_scheme_id]"
                                        required
                                    >
                                        <option value="">Select</option>
                                        <option value="1">
                                            Select Country and Education level
                                            before
                                        </option>
                                        <option className="2">Other</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div className="stud-row">
                    <div className="stud-title mt-4">
                        <div className="row">
                            <div className="col-6">
                                <h3>
                                    {trans("student_profile.schools_attended")}
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div className="row school_0">
                        <div className="col-lg-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.level_of_edu"
                                    )}
                                    *
                                </label>
                                <div className="selectPart w-100">
                                    <select
                                        className="customSelect form-control"
                                        name="attended[at_edu_level_id]"
                                        required
                                    >
                                        <option value="">
                                            Select Education Level
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div className="col-lg-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.country_of_institution"
                                    )}
                                    *
                                </label>
                                <div className="selectPart w-100">
                                    <select
                                        className="customSelecte form-control"
                                        name="attended[at_edu_country_id]"
                                        required
                                    >
                                        <option value="">
                                            Select Institution Country
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.name_of_institution"
                                    )}
                                    *
                                </label>
                                <input
                                    type="text"
                                    className="form-control"
                                    name="attended[at_edu_institution_name]"
                                    placeholder={trans(
                                        "student_profile.form.placeholder.institution_name"
                                    )}
                                    required
                                />
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.primary_language_of_institution"
                                    )}
                                    *
                                </label>
                                <input
                                    type="text"
                                    className="form-control"
                                    name="attended[at_edu_primary_institution_language]"
                                    placeholder={trans(
                                        "student_profile.form.placeholder.primary_language"
                                    )}
                                    required
                                />
                            </div>
                        </div>

                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.attended_institution_from"
                                    )}
                                    *
                                </label>
                                <input
                                    type="text"
                                    className="form-control datepicker"
                                    name="attended[at_edu_from_date]"
                                    required
                                />
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.attended_institution_to"
                                    )}
                                    *
                                </label>
                                <input
                                    type="text"
                                    className="form-control datepicker"
                                    name="attended[at_edu_to_date]"
                                    required
                                />
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.degree_award"
                                    )}
                                    *
                                </label>
                                <input
                                    type="text"
                                    className="form-control"
                                    name="attended[at_edu_degree_award]"
                                    placeholder={trans(
                                        "student_profile.form.placeholder.degree_award"
                                    )}
                                    required
                                />
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.degree_award_on"
                                    )}
                                    *
                                </label>
                                <input
                                    type="text"
                                    className="form-control datepicker"
                                    name="attended[at_edu_degree_award_date]"
                                    placeholder={trans(
                                        "student_profile.form.placeholder.degree_award_on"
                                    )}
                                    required
                                />
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.schools_address"
                                    )}
                                    *
                                </label>
                                <input
                                    type="text"
                                    className="form-control"
                                    name="attended[at_edu_school_address]"
                                    placeholder={trans(
                                        "student_profile.form.placeholder.school_address"
                                    )}
                                    required
                                />
                            </div>
                        </div>
                    </div>
                    <div className="row">
                        <div className="col-12">
                            <div className="add-attended">
                                <a
                                    href=""
                                    className="add-attended-btn"
                                    id="add_school"
                                >
                                    <i className="fas fa-plus mr-1"></i> Add
                                    Attended School
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

export default EducationSummaryComponent;

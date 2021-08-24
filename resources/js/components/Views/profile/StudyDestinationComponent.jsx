import React, { Component } from "react";
import { trans } from "../../Localization";

class StudyDestinationComponent extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div
                className={
                    "tab-pane" + (this.props.step == 4 ? " active" : " hidden")
                }
                id="tab4"
            >
                <div className="stud-row">
                    <div className="stud-title mt-4">
                        <h3>{trans("student_profile.study_destination")}</h3>
                    </div>
                    <div className="row">
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.program_levels"
                                    )}
                                </label>
                                <div className="selectPart w-100">
                                    <select
                                        className="customSelect form-control"
                                        name="education[study_program_level_id]"
                                        required
                                    >
                                        <option value="">Select</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.start_dates"
                                    )}
                                </label>
                                <input
                                    type="text"
                                    className="form-control datepicker"
                                    name="education[study_start_date]"
                                    required
                                />
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="form-group">
                                <label>
                                    {trans(
                                        "student_profile.form.title.study_area"
                                    )}
                                </label>
                                <div className="selectPart w-100">
                                    <select
                                        className="customSelect form-control"
                                        name="education[study_area_id]"
                                    >
                                        <option value="">Select</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

export default StudyDestinationComponent;

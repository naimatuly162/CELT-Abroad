import React, { Component } from "react";
import { trans } from "../../Localization";

class TestScoresComponent extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div
                className={
                    "tab-pane" + (this.props.step == 3 ? " active" : " hidden")
                }
                id="tab3"
            >
                <div className="stud-row">
                    <div className="stud-title mt-4">
                        <h3>{trans("student_profile.test_scores")}</h3>
                    </div>
                    <div className="row">
                        <div className="col-12">
                            <div className="row">
                                <div className="col-lg-5">
                                    <div className="testScores-col mb-4">
                                        <div className="mail-account-switch">
                                            <label
                                                className="switch-mail"
                                                htmlFor="account1"
                                            >
                                                <input
                                                    type="radio"
                                                    id="account1"
                                                    defaultValue="ieltsexam"
                                                    name="score[exam_id]"
                                                    checked="checked"
                                                />
                                                <span className="mail-slider mail-round"></span>
                                            </label>
                                            <span className="align-middle">
                                                {trans(
                                                    "student_profile.have_ielts"
                                                )}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-5">
                                    <div className="testScores-col mb-4">
                                        <div className="mail-account-switch">
                                            <label
                                                className="switch-mail"
                                                htmlFor="account2"
                                            >
                                                <input
                                                    type="radio"
                                                    id="account2"
                                                    defaultValue="toeflexam"
                                                    name="score[exam_id]"
                                                />
                                                <span className="mail-slider mail-round"></span>
                                            </label>
                                            <span className="align-middle">
                                                {trans(
                                                    "student_profile.have_toefl"
                                                )}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="test-row">
                                <div id="ieltsexam" className="ielts-exam">
                                    <div className="row">
                                        <div className="col-md-6">
                                            <div className="form-group">
                                                <label>
                                                    {trans(
                                                        "student_profile.form.title.english_exam_date"
                                                    )}
                                                </label>
                                                <input
                                                    type="text"
                                                    className="form-control datepicker"
                                                    name="score[exam_date]"
                                                />
                                            </div>
                                        </div>
                                        <div className="col-md-12">
                                            <div className="form-group">
                                                <label>
                                                    {trans(
                                                        "student_profile.form.title.input_exact_scores"
                                                    )}
                                                </label>
                                                <div className="row">
                                                    <div className="col-md-6 col-lg-3">
                                                        <input
                                                            type="text"
                                                            placeholder={trans(
                                                                "student_profile.form.placeholder.reading"
                                                            )}
                                                            className="form-control mb-3"
                                                            name="score[reading_score]"
                                                        />
                                                    </div>
                                                    <div className="col-md-6 col-lg-3">
                                                        <input
                                                            type="text"
                                                            placeholder={trans(
                                                                "student_profile.form.placeholder.listening"
                                                            )}
                                                            className="form-control mb-3"
                                                            name="score[listening_score]"
                                                        />
                                                    </div>
                                                    <div className="col-md-6 col-lg-3">
                                                        <input
                                                            type="text"
                                                            placeholder={trans(
                                                                "student_profile.form.placeholder.speaking"
                                                            )}
                                                            className="form-control mb-3"
                                                            name="score[speaking_score]"
                                                        />
                                                    </div>
                                                    <div className="col-md-6 col-lg-3">
                                                        <input
                                                            type="text"
                                                            placeholder={trans(
                                                                "student_profile.form.placeholder.writing"
                                                            )}
                                                            className="form-control mb-3"
                                                            name="score[writing_score]"
                                                        />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div className="col-md-4">
                                            <div className="form-group">
                                                <label>
                                                    {trans(
                                                        "student_profile.form.title.overal_score"
                                                    )}
                                                </label>
                                                <input
                                                    type="text"
                                                    placeholder={trans(
                                                        "student_profile.form.placeholder.overal_score"
                                                    )}
                                                    className="form-control"
                                                    name="score[overal_score]"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="test-row">
                                <div
                                    id="toeflexam"
                                    className="toefl-exam mb-2"
                                    style={{
                                        display: "none"
                                    }}
                                >
                                    <div className="row">
                                        <div className="col-md-6">
                                            <div className="form-group">
                                                <label>
                                                    {trans(
                                                        "student_profile.form.title.english_exam_date"
                                                    )}
                                                </label>
                                                <input
                                                    type="text"
                                                    className="form-control datepicker"
                                                    name="score[exam_date]"
                                                />
                                            </div>
                                        </div>
                                        <div className="col-md-12">
                                            <div className="form-group">
                                                <label>
                                                    {trans(
                                                        "student_profile.form.title.input_exact_scores"
                                                    )}
                                                </label>
                                                <div className="row">
                                                    <div className="col-md-6 col-lg-3">
                                                        <input
                                                            type="text"
                                                            placeholder={trans(
                                                                "student_profile.form.placeholder.reading"
                                                            )}
                                                            className="form-control mb-3"
                                                            name="score[reading_score]"
                                                        />
                                                    </div>
                                                    <div className="col-md-6 col-lg-3">
                                                        <input
                                                            type="text"
                                                            placeholder={trans(
                                                                "student_profile.form.placeholder.listening"
                                                            )}
                                                            className="form-control mb-3"
                                                            name="score[listening_score]"
                                                        />
                                                    </div>
                                                    <div className="col-md-6 col-lg-3">
                                                        <input
                                                            type="text"
                                                            placeholder={trans(
                                                                "student_profile.form.placeholder.speaking"
                                                            )}
                                                            className="form-control mb-3"
                                                            name="score[speaking_score]"
                                                        />
                                                    </div>
                                                    <div className="col-md-6 col-lg-3">
                                                        <input
                                                            type="text"
                                                            placeholder={trans(
                                                                "student_profile.form.placeholder.writing"
                                                            )}
                                                            className="form-control mb-3"
                                                            name="score[writing_score]"
                                                        />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div className="col-md-4">
                                            <div className="form-group">
                                                <label>
                                                    {trans(
                                                        "student_profile.form.title.overal_score"
                                                    )}
                                                </label>
                                                <input
                                                    type="text"
                                                    placeholder={trans(
                                                        "student_profile.form.placeholder.overal_score"
                                                    )}
                                                    className="form-control"
                                                    name="score[overal_score]"
                                                />
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

export default TestScoresComponent;

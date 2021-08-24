import React, { Component } from "react";
import { trans } from "../../Localization";
import PersonalInformation from "./PersionalInformationConponent";
import EducationSummary from "./EducationSummaryComponent";
import TestScores from "./TestScoresComponent";
import StudyDestination from "./StudyDestinationComponent";

export default class Profile extends Component {
    constructor(props) {
        super(props);

        this.state = {
            step: 1
        };
        this.changeStep = this.changeStep.bind(this);
    }

    changeStep(event, _step) {
        event.preventDefault();
        this.setState((state, prop) => {
            return { step: _step };
        });
    }

    render() {
        return (
            <div className="main-content">
                <section className="spacepadding">
                    <div className="container">
                        <div className="row justify-content-center">
                            <div className="col-md-10">
                                <div className="student-info">
                                    <form
                                        id="studentForm"
                                        method="POST"
                                        noValidate
                                        onSubmit={event =>
                                            this.changeStep(
                                                event,
                                                this.state.step + 1
                                            )
                                        }
                                    >
                                        <div id="rootwizard">
                                            <div className="tab-content student-details-content">
                                                <div
                                                    id="bar"
                                                    className="progress progress-striped"
                                                >
                                                    <div
                                                        className="progress-bar"
                                                        style={{
                                                            width:
                                                                this.state
                                                                    .step *
                                                                    20 +
                                                                "%"
                                                        }}
                                                    >
                                                        {this.state.step * 20}%
                                                    </div>
                                                </div>

                                                <PersonalInformation
                                                    changeStep={this.changeStep}
                                                    step={this.state.step}
                                                />

                                                <EducationSummary
                                                    changeStep={this.changeStep}
                                                    step={this.state.step}
                                                />

                                                <TestScores
                                                    changeStep={this.changeStep}
                                                    step={this.state.step}
                                                />

                                                <StudyDestination
                                                    changeStep={this.changeStep}
                                                    step={this.state.step}
                                                />

                                                <ul className="wizard ca-wizard mt-4">
                                                    <li className="previous">
                                                        <a
                                                            href=""
                                                            className={
                                                                "btn-theme btn-theme-blue" +
                                                                (this.state
                                                                    .step == 1
                                                                    ? "hidden"
                                                                    : "")
                                                            }
                                                            onClick={event =>
                                                                this.changeStep(
                                                                    event,
                                                                    this.state
                                                                        .step -
                                                                        1
                                                                )
                                                            }
                                                        >
                                                            {trans(
                                                                "student_profile.previous"
                                                            )}
                                                        </a>
                                                    </li>

                                                    <li className="next">
                                                        <input
                                                            type="submit"
                                                            className="btn-theme btn-theme-blue"
                                                            value={
                                                                this.state
                                                                    .step < 4
                                                                    ? trans(
                                                                          "student_profile.next"
                                                                      )
                                                                    : "Finish"
                                                            }
                                                        />
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        );
    }
}

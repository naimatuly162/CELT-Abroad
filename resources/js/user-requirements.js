function preSection(hide, show) {
    $(`.${hide}`).hide();
    $(`.${show}`).show();
}

function nextSection(hide, show) {
    $(`.${hide}`).hide();
    $(`.${show}`).show();
}

window.addEventListener('DOMContentLoaded', (event) => {
    //test requirements
    let currentData;
    let url = `/test-requirements`;
    let matchData;

    const place = document.querySelector('body');
    if (typeof place != 'undefined' && place != null) {
        place.addEventListener('click', function (e) {
            let pl = e.target;

            //test requirements data
            if (typeof pl != 'undefined' && pl != null && pl.classList.contains('eduction_label_id')) {
                currentData = {education_level_id: pl.getAttribute('data-edu_label_id')}
                console.log(currentData);

            }

            if (typeof pl != 'undefined' && pl != null && pl.classList.contains('country_code_id')) {
                currentData = {country_id: pl.getAttribute('data-country_code_id')}
                console.log('cid', currentData);
            }

            if (typeof pl != 'undefined' && pl != null && pl.classList.contains('activities_type')) {
                currentData = {activity: pl.getAttribute('data-activities_type')}
                console.log('activity', currentData);
            }

            if (typeof pl != 'undefined' && pl != null && pl.classList.contains('start_business')) {
                currentData = {start_business: pl.getAttribute('data-start_business')}
                console.log('business', currentData);
            }

            if (typeof pl != 'undefined' && pl != null && pl.classList.contains('teach_people_id')) {
                currentData = {teach_people: pl.getAttribute('data-teach_people_id')}
                console.log('teach', currentData);
            }

            //match requirements data
            if (typeof pl != 'undefined' && pl != null && pl.classList.contains('match_eduction_label_id')) {
                matchData = {education_level_id: pl.getAttribute('data-match_edu_label_id')}
                console.log('matach_edu', matchData);
            }

            if (typeof pl != 'undefined' && pl != null && pl.classList.contains('study_types')) {
                matchData = pl.getAttribute('data-study_types')
                console.log('study_type_id', matchData);
            }

            if (typeof pl != 'undefined' && pl != null && pl.classList.contains('session_types')) {
                matchData = pl.getAttribute('data-session_types')
                console.log('session_id', matchData);
            }


        })
    }


    $('#eduction_label_id').click(e => {
        saveInformation(currentData, "study-level-section", "nationality-section");
    })

    $('#country_code_id').click(e => {
        saveInformation(currentData, "nationality-section", "future-section");
    })

    $('#activities_type_id').click(e => {
        saveInformation(currentData, "future-section", "business-section");
    })

    $('#start_business_cls').click(e => {
        saveInformation(currentData, "business-section", "teach-section");
    })

    $('#teach_people_id').click(e => {
        saveInformation(currentData, "teach-section", "discipline-study-section");
    })

    $('#study_area_type_id').change(e => {
        currentData = {study_area_id: $("#study_area_type_id option:selected").val()}
        console.log('test_study_area_id', $("#study_area_type_id option:selected").val());
    })
    $('#study_area_finished').click(e => {
        currentData = {study_area_id: ($("#study_area_type_id option:selected").val() ? $("#study_area_type_id option:selected").val() : null)};
        if (currentData) {
            Object.assign(currentData, {last_stage: true});
        } else {
            currentData = {last_stage: true};
        }
        console.log(currentData);
        saveInformation(currentData, "discipline-study-section", null);
    })

    // save test requirements info
    async function saveInformation(data, hide, show) {
        await axios.post(url, data).then(response => {
            let res = response.data;
            currentData = null;
            nextSection(hide, show)
            if (res.success && typeof res.url != "undefined") {
                window.location = res.url;
            }
            // console.log(currentClassInfo);
            // window.location=currentClassInfo.url;
        })
    }


    //match requirements
    let matchUrl = `/match-requirements`;
    let selected_val = null;
    let exam_selected_val;
    $('#match_edu_label_id').click(e => {
        let education_level_id = $('.match_eduction_label_item_check_active .match_eduction_label_id').filter('.active').data('match_edu_label_id');
        matchData = (education_level_id ? education_level_id : null);
        saveMatchInformation({education_level_id: matchData}, "study-level-section", "nationality-section");
    })

    $('#study_destination_handle').click(e => {
        let study_destination_lists = document.querySelector('.study_destination_item_check_active').children;
        const destination_items = Array.from(study_destination_lists)
            .filter(chapter => chapter.classList.contains("active") && !chapter.classList.contains("item-box-all"))
        let destination = []
        for (const study_destination of destination_items) {
            console.log(study_destination.getAttribute('data-study_destination_id'));
            destination.push(study_destination.getAttribute('data-study_destination_id'));
        }
        saveMatchInformation({study_destination: destination}, "destination-section", "session-section");
    })

    $('#nationality_id').change(e => {
        selected_val = $("#nationality_id option:selected").val();
        console.log('cc', $("#nationality_id option:selected").val());
    })

    $('#study_nationality_id').click(e => {
        selected_val = ($("#nationality_id option:selected").val() ? $("#nationality_id option:selected").val() : null);

        let study_type = $('.study_types_item_check_active .study_types').filter('.active').data('study_types');
        matchData = (study_type ? study_type : null);

        saveMatchInformation({
            country_id: selected_val,
            study_type_id: matchData
        }, "nationality-section", "destination-section");
    })

    $('#match_study_area_id').change(e => {
        selected_val = $("#match_study_area_id option:selected").val();
        console.log('studyarea-id', $("#match_study_area_id option:selected").val());
    })

    $('#study_session_id').click(e => {
        let study_area_ids = [];
        if ($("#match_study_area_id option:selected").length > 0) {
            $("#match_study_area_id option:selected").each(function () {
                study_area_ids.push(this.value);
            });
        }
        let session_type = $('.session_types_item_check_active .session_types').filter('.active').data('session_types');
        matchData = (session_type ? session_type : null);
        saveMatchInformation({
            study_area_id: study_area_ids,
            session_id: matchData
        }, "session-section", "previous-study-level-section");
    })

    $('#previous_study_label').change(e => {
        selected_val = $("#previous_study_label option:selected").val();
        console.log('previous-id', $("#previous_study_label option:selected").val());
    })

    $('#exam_types_id').change(e => {
        exam_selected_val = $("#exam_types_id option:selected").val();
        console.log('exam-id', $("#exam_types_id option:selected").val());
    })

    $('#exam_previous_study').click(e => {
        const user_test_score = [];
        // const input_array = [];
        const inputs = $('input[name="exam_type_score_inputs"]').serialize();
        console.log(inputs, 'inputs')
        $(".checkbox_exam_btn:checked").each(function (el, index) {
            let exam_id = $(this).val();
            let score = $(`.exam_type_inputs_${exam_id}`).val();
            let obj = {
                exam_id,
                score
            }
            user_test_score.push(obj);
        });

        // let arr = $('.checkbox_exam_btn:checked').map(function () {
        //     return this.value;
        // }).get();
        console.log('checkbox_exam_data', user_test_score)


        // var formData = new FormData($("#user-matching-test-score"));
        // console.log('usertestdata', formData)
        let score = (!$('#exam_test_score').val() ? 0 : $('#exam_test_score').val());
        selected_val = $("#previous_study_label option:selected").val() ? $("#previous_study_label option:selected").val() : null;
        exam_selected_val = $("#exam_types_id option:selected").val() ? $("#exam_types_id option:selected").val() : null;
        saveMatchInformation({
            previous_study_level: selected_val,
            user_test_score: user_test_score,
            submit: true,
        }, "previous-study-level-section", "work-experience-section");
    })


    // save test requirements info
    async function saveMatchInformation(data, hide, show) {
        // if(matchData ==null){
        //     nextSection(hide, show)
        //     return ;
        // }
        await axios.post(matchUrl, data).then(response => {
            let match_results = response.data;
            nextSection(hide, show)
            selected_val = null;
            matchData = null;
            if(match_results.type=='user_login'){
                let urlParams=window.location.pathname.includes('program/single');
                if(urlParams){
                    location.reload();
                }else{
                    // let urll = "{{ route('design.program') }}";
                    document.location.href='/program';
                }
            }
            if(match_results.type=='last_stage'){
                $("#user_confirmation_modal").modal('show');
                // $("#user_login_component").modal('show');
            }
            console.log(match_results)
        })
    }


    // $("#modal-btn-login").on("click", function(){
    //     $("#user_confirmation_modal").modal('hide');
    //     $("#user_login_component").modal('show');
    //     $(".show-login-section").css("display", "block !important");
    // });

    // $("#modal-btn-close").on("click", function(){
    //     location.reload();
    // });
    $(".login_modal_btn_close").on('click',function (){
        console.log('sdfds');
        location.reload();
    })

    // $("#user_confirmation_modal").modal('show');
});

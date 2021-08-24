var _body = "",
    _html = "",
    _htmlBody = "",
    _window = "",
    _interTime = "";

var $ = jQuery;
jQuery(document).ready(function () {
    _body = jQuery("body");
    _html = jQuery("html");
    _htmlBody = jQuery("html, body");
    _window = jQuery(window);

    if ($("#scroll-top").length) {
        function scrollToTop() {
            var $scrollUp = $("#scroll-top"),
                $lastScrollTop = 0,
                $window = $(window);

            $window.on("scroll", function () {
                var st = $(this).scrollTop();
                if (st > $lastScrollTop) {
                    $scrollUp.removeClass("show");
                } else {
                    if ($window.scrollTop() > 200) {
                        $scrollUp.addClass("show");
                    } else {
                        $scrollUp.removeClass("show");
                    }
                }
                $lastScrollTop = st;
            });

            $scrollUp.on("click", function (evt) {
                $("html, body").animate({ scrollTop: 0 }, 600);
                evt.preventDefault();
            });
        }
        scrollToTop();
    }

    $('body').find('select2').each(function () {
        var dropdownParents = $(this).parents('.selectPart')
        $(this).select2({
            dropdownParent: dropdownParents,
        });
    });

    $('.user-passprot-file').on('click', function () {
        $('#profile-img').trigger('click');
    });

    $(window).on("load", function () {
        var bannerheight = $(window).height();
        $(".home-banner").height(bannerheight);

        $(window)
            .on("resize customResize", function () {
                if (_interTime) {
                    clearTimeout(_interTime);
                    _interTime = "";
                }

                _interTime = setTimeout(function () {
                    headerStuck();
                }, 0);

                // var bannerheight = $(window).innerHeight();
                // $(".home-banner").height(bannerheight);
            })
            .trigger("customResize");

        setTimeout(function () {
            _html.addClass("window-loaded-delay");
            headerStuck();
        }, 1000);

        _html.addClass("window-loaded");

        $(".toggle-btn").on("click", function () {
            $(".menu-part").css({ right: "0%" });
            $(".overlay-bg").css({ opacity: "1", visibility: "visible" });
        });
        $(".close-menu").on("click", function () {
            $(".menu-part").css({ right: "-100%" });
            $(".overlay-bg").css({ opacity: "0", visibility: "hidden" });
        });
        $(".overlay-bg").on("click", function () {
            $(".menu-part").css({ right: "-100%" });
            $(this).css({ opacity: "0", visibility: "hidden" });
        });

        $("#popular-country").owlCarousel({
            autoplay: false,
            smartSpeed: 2000,
            loop: false,
            items: 3,
            dots: false,
            slideSpeed: 20000,
            autoplayHoverPause: true,
            nav: true,
            margin: 80,
            responsiveClass: true,
            navText: [
                "<img src='images/owl-pre.png' alt=''>",
                "<img src='images/owl-next.png' alt=''>"
            ],
            responsive: {
                0: { items: 1 },
                481: { items: 2 },
                770: { items: 2 },
                981: { items: 3 },
                1025: { items: 3 },
                1200: { items: 3 }
            }
        });

        if ($(".datepicker").length) {
            $(".datepicker").daterangepicker({
                singleDatePicker: true,
                autoUpdateInput: true,
                showDropdowns: true,
                locale: {
                    // format: "DD/MM/YYYY"
                    format: "YYYY-MM-DD"
                }
            });
        }

        $(
            '.account-tab > ul input[name="modalLogin"], .account-tab > ul input[name="modalregister"]'
        ).on("change", function () {
            var thisvar = $(this).val();
            $(this)
                .parents(".account-tab")
                .find(".modalAccountPart")
                .hide();
            $(this)
                .parents(".account-tab")
                .find("#" + thisvar)
                .show();
        });

        $(".edit-btn").on("click", function () {
            $(this)
                .parents(".editinput")
                .find(".form-control")
                .prop("disabled", false);
            $(this)
                .parents(".editinput")
                .find(".customSelect")
                .prop("disabled", false);
            $(this)
                .parents(".editinput")
                .removeClass("editinput");
        });
        // $(".home-continue").on("click", function() {
        //     $(".home-form-step1").addClass("active-step1");
        //     setTimeout(() => {
        //         $(".home-form-step2").addClass("active-step2");
        //     }, 300);
        //     setTimeout(() => {
        //         $(".home-form-step1").hide();
        //         //$('.home-form-step2').show();
        //     }, 300);
        // });
        $("#profile-img").change(function () {
            readURL(this);
        });
        if ($(".detail_slider").length) {
            $(".detail_slider").slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: true,
                fade: true,
                asNavFor: ".slick-slider-nav",
                adaptiveHeight: true,
                prevArrow:
                    '<button type="button" class="slick-prev"><i class="fas fa-chevron-left"></i></button>',
                nextArrow:
                    '<button type="button" class="slick-next"><i class="fas fa-chevron-right"></i></button>'
            });
        }
        if ($(".slick-slider-nav").length) {
            $(".slick-slider-nav").slick({
                slidesToShow: 6,
                slidesToScroll: 1,
                arrows: false,
                asNavFor: ".detail_slider",
                dots: false,
                // centerMode: true,
                focusOnSelect: true,
                responsive: [
                    {
                        breakpoint: 992,
                        settings: {
                            slidesToShow: 6
                        }
                    },
                    {
                        breakpoint: 768,
                        settings: {
                            slidesToShow: 4
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 3
                        }
                    }
                ]
            });
        }
        $('div[role="dialog"]').on("show.bs.modal", function (e) {
            setTimeout(() => {
                $("body").addClass("modal-open");
                $("body").css({ "padding-right": "17px" });
            }, 1000);
        });
        $('div[role="dialog"]').on("hide.bs.modal", function (e) {
            $("body").attr("style", "");
        });
        if ($("#partners_logo").length) {
            $("#partners_logo").owlCarousel({
                loop: true,
                margin: 30,
                nav: false,
                dots: false,
                autoWidth: true,
                autoplay: true,
                autoplayTimeout: 5000,
                autoplayHoverPause: false,
                responsive: {
                    0: {
                        items: 2,
                        autoWidth: false
                    },
                    480: {
                        items: 3,
                        autoWidth: false
                    },
                    600: {
                        items: 4,
                        autoWidth: false
                    },
                    1000: {
                        items: 5,
                        autoWidth: false
                    }
                }
            });
        }
    });
});

$(document).ready(function () {
    var options = {
        max_value: 5,
        step_size: 1,
        selected_symbol_type: 'fontawesome_star',
        update_input_field_name: $("#rate-input"),
    }
    if ($(".rate").length) {
        $(".rate").rate(options);
    }
});

//Theme loader
$(window).on("load", function () {
    $(".book_preload")
        .delay(1000)
        .fadeOut(200);
    $(".book").on("click", function () {
        $(".book_preload").fadeOut(200);
    });
});

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $("#profile-img-tag").attr("src", e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

function headerStuck() {
    if (jQuery(".header").length) {
        jQuery(window).scroll(function () {
            var headerHeight = jQuery(".header");
            var scroll = jQuery(window).scrollTop();
            if (scroll >= 100) {
                headerHeight.addClass("is-stuck");
            } else {
                headerHeight.removeClass("is-stuck");
            }
        });
    }
}

function isMobile() {
    //for detect mobile browser
    var appsVersion = navigator.appVersion,
        isAndroid = /android/gi.test(appsVersion),
        isIOS = /iphone|ipad|ipod/gi.test(appsVersion);
    return (
        isAndroid ||
        isIOS ||
        /(Opera Mini)|Kindle|webOS|BlackBerry|(Opera Mobi)|(Windows Phone)|IEMobile/i.test(
            navigator.userAgent
        )
    );
}

$('.decimal').on("keypress keyup blur", function (event) {
    $(this).val($(this).val().replace(/[^0-9\.]/g, ''));
    if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
        event.preventDefault();
    }
});

(function () {
    'use strict';
    window.addEventListener('load', function () {

        var forms = document.getElementsByClassName('needs-validation');

        var validation = Array.prototype.filter.call(forms, function (form) {

            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });

    }, false);
})();

// County state city droupdowns
var state_xhr = undefined;

$("#country").on('change', function () {
    if (state_xhr) {
        state_xhr.abort();
    }


    $("#state").html('<option value="">Loading...</option>');
    $("#city").html('<option value="">Loading...</option>');

    var country = $(this).val();
    var state_html = '<option value="">Select State</option>';
    var city_html = '<option value="">Select City</option>';

    state_xhr = $.ajax({
        type: 'GET',
        data: { country: country },
       // url: base_url + '/state',
        url: '/state',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        success: function (data) {

            if (data.states && data.states.length > 0) {
                $("#state").attr('required', true);
                data.states.forEach(function (element) {
                    state_html += "<option value=" + element.id + ">" + element.title + "</option>";
                });
            } else if (data.cities) {
                $("#state").attr('required', false);
                if (data.cities && data.cities.length > 0) {
                    $("#city").attr('required', true);
                    data.cities.forEach(function (element) {
                        city_html += "<option value=" + element.id + ">" + element.title + "</option>";
                    });
                } else {
                    $("#city").attr('required', false);
                }
            }

            $("#state").html(state_html);
            $("#city").html(city_html);
        }
    });
});


var city_xhr = undefined;

$("#state").on('change', function () {

    if (city_xhr) {
        city_xhr.abort();
    }

    $("#city").html('<option value="">Loading...</option>');

    var state = $(this).val();
    var country = $("#country").val();
    var city_html = '<option value="">Select City</option>';

    var city_xhr = $.ajax({
        type: 'GET',
        data: { state: state, country: country },
        //url: base_url + '/city',
        url: '/city',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        success: function (data) {
            if (data.cities && data.cities.length > 0) {
                $("#city").attr('required', true);
                data.cities.forEach(function (element) {
                    city_html += "<option value=" + element.id + ">" + element.title + "</option>";
                });
            } else {
                $("#city").attr('required', false);
            }

            $("#city").html(city_html);
        }
    });
});

// END County state city droupdowns

$("#login-modal").on('show.bs.modal', function () {
    $("#studentloginform").removeClass('was-validated');
    $("#unireploginform").removeClass('was-validated');
    document.getElementById("unireploginform").reset();
    document.getElementById("studentloginform").reset();
});

$("#studentloginform").on('submit', function (e) {
    if ($(this)[0].checkValidity() === true) {
        e.preventDefault();
        e.stopPropagation();
        $('.studentlogin').attr('disabled', true);

        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: $(this).serialize(),
            success: function (response) {
                if (response.success == false) {
                    toastr.error(response.message, 'CELT Abroad');
                } else {
                    toastr.success(response.message, 'CELT Abroad');
                    $("#login-modal").modal('hide');
                    window.location.href = response.url;
                }
            },
            error: function (response) {
                toastr.error(response.message, 'CELT Abroad');
            },
            complete: function () {
                $('.studentlogin').attr('disabled', false);
            }
        })
    }
});

$("#forgetpassform").on('submit', function (e) {
    if ($(this)[0].checkValidity() === true) {
        e.preventDefault();
        e.stopPropagation();
        $('.forgetPass').attr('disabled', true);

        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: $(this).serialize(),
            success: function (response) {
                if (response.success == false) {
                    toastr.error(response.message, 'CELT Abroad');
                } else {
                    toastr.success(response.message, 'CELT Abroad');
                    $('#forgotpassword-modal').modal('hide');
                }
            },
            error: function (response) {
                toastr.error(response.message, 'CELT Abroad');
            },
            complete: function () {
                $('.forgetPass').attr('disabled', false);
            }
        })
    }
});

$("#checkeligibleform").on('submit', function (e) {
    if ($(this)[0].checkValidity() === true) {
        e.preventDefault();
        e.stopPropagation();
        $('.checkEligible').attr('disabled', true);

        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: $(this).serialize(),
            success: function (response) {
                if (response.success == false) {
                    toastr.error(response.message, 'CELT Abroad');
                } else {
                    toastr.success(response.message, 'CELT Abroad');
                    // $('#forgotpassword-modal').modal('hide');
                    window.location = '/profile';
                }
            },
            error: function (response) {
                toastr.error(response.message, 'CELT Abroad');
            },
            complete: function () {
                $('.checkEligible').attr('disabled', false);
            }
        })
    }
});

$("#unirepforgetpassform").on('submit', function (e) {
    if ($(this)[0].checkValidity() === true) {
        e.preventDefault();
        e.stopPropagation();
        $('.unirepforgetPass').attr('disabled', true);

        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: $(this).serialize(),
            success: function (response) {
                if (response.success == false) {
                    toastr.error(response.message, 'CELT Abroad');
                } else {
                    toastr.success(response.message, 'CELT Abroad');
                    $('#unirep-forgotpassword-modal').modal('hide');
                }
            },
            error: function (response) {
                toastr.error(response.message, 'CELT Abroad');
            },
            complete: function () {
                $('.unirepforgetPass').attr('disabled', false);
            }
        })
    }
});

$("#unireploginform").on('submit', function (e) {
    if ($(this)[0].checkValidity() === true) {
        e.preventDefault();
        e.stopPropagation();
        $('.unireplogin').attr('disabled', true);

        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: $(this).serialize(),
            success: function (response) {
                if (response.success == false) {
                    toastr.error(response.message, 'CELT Abroad');
                } else {
                    var ur_url = response.redirect_url;
                    $("#login-modal").modal('hide');
                    toastr.success(response.message, 'CELT Abroad');
                    window.location.replace(ur_url);
                }
            },
            error: function (response) {
                toastr.error(response.message, 'CELT Abroad');
            },
            complete: function () {
                $('.unireplogin').attr('disabled', false);
            }
        })
    }
});

$("#newsletterform").on('submit', function (e) {
    if ($(this)[0].checkValidity() === true) {
        e.preventDefault();
        e.stopPropagation();

        $('.footerbtn').removeAttr('disabled', true);

        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: $(this).serialize(),
            success: function (response) {
                if (response.success == false) {
                    toastr.error(response.message, 'CELT Abroad');
                } else {
                    // $(this).reset();
                    toastr.success(response.message, 'CELT Abroad');
                }
            },
            error: function (response) {
                toastr.error(response.message, 'CELT Abroad');
            },
            complete: function () {
                $('.footerbtn').removeAttr('disabled', false);
            }
        })
    }
});

$(document).on('change', '.startmonth', function(){
    var key = $(this).attr('data-key');
    var month = $(this).val();
    var selector = $('select[name="deadline['+key+'][start_date]"]');
    getDate(month, selector);
})

$(document).on('change', '.lastmonth', function(){
    var key = $(this).attr('data-key');
    var month = $(this).val();
    var selector = $('select[name="deadline['+key+'][last_date]"]');
    getDate(month, selector);
})

function getDate(month, selector)
{
    selector.html('<option>Loading..</option>');
    $.ajax({
        type: "GET",
        url: base_url + '/unirep/getdate/'+month,
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: {month : month},
        success: function (response) {
            $html = "<option>Select Date</option>";
            $.each(response, function(k, value){
                $html +=  '<option value="'+value+'">'+value+'</option>';
            });
            $(selector).html($html);
        }
    })
}

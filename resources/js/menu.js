
// login section toggle class
$(".login-btn").click(function (e) {
    e.preventDefault();
    $(".signup-section").hide();
    $(".login-section").show();
    $(".forget-section").hide();
    $(".otp-section").hide();
    $(".reset-password-section").hide();
});
$(".reset-password-section").hide();
$(".wishlist-reset-password-section").hide();
$("body").on('click', ".signup-btn", function (e) {
    e.preventDefault();
    $(".signup-section").show();
    $(".login-section").hide();
    $(".forget-section").hide();
    $(".otp-section").hide();
    $(".reset-password-section").hide();
});
$(".forget-pass").click(function (e) {
    e.preventDefault();
    $(".login-section").hide();
    $(".forget-section").show();
});
$(".send-btn").click(function (e) {
    // e.preventDefault();
    // $(".otp-section").show();
    // $(".forget-section").hide();
});
$(".confirm-btn").click(function (e) {
    // e.preventDefault();
    // $(".dropdown-menu-custom").removeClass('show');
    // $(".otp-section").hide();
    // $(".signup-section").show();
});
$(".password-toggle").click(function (e) {
    e.preventDefault();
    $(this).toggleClass('fa-eye-slash fa-eye');
    if ($(this).hasClass("fa-eye")) {
        $(".password-toggle-data").attr('type', 'text');
    } else {
        $(".password-toggle-data").attr('type', 'password');
    }
});

$("body").on('click', ".dropdown-toggle-custom", function () {
    $(".dropdown-menu-custom").toggleClass('show');
    $(".nav-wishlist").removeClass('show');
});
$("body").on('click', ".dropdown-menu-custom .close-login", function () {
    $(".dropdown-menu-custom").removeClass('show');
});

// Wishlist section toggle class
$(".login-btn-wishlist").click(function (e) {
    e.preventDefault();
    $(".signup-section-wishlist").hide();
    $(".login-section-wishlist").show();
    $(".forget-section-wishlist").hide();
    $(".otp-section-wishlist").hide();
    $(".reset-password-section").hide();
});
$(".signup-btn-wishlist").click(function (e) {
    e.preventDefault();
    $(".signup-section-wishlist").show();
    $(".login-section-wishlist").hide();
    $(".forget-section-wishlist").hide();
    $(".otp-section-wishlist").hide();
    $(".reset-password-section").hide();
});
$(".forget-pass-wishlist").click(function (e) {
    e.preventDefault();
    $(".login-section-wishlist").hide();
    $(".forget-section-wishlist").show();
});
$(".send-btn-wishlist").click(function (e) {
    // e.preventDefault();
    // $(".otp-section-wishlist").show();
    // $(".forget-section-wishlist").hide();
});
$(".confirm-btn-wishlist").click(function (e) {
    e.preventDefault();
    //$(".dropdown-menu-custom-wishlist").removeClass('show');
    $("body").removeClass('modalOverley');
    $(".otp-section-wishlist").hide();
    $(".signup-section-wishlist").show();
});
$(".password-toggle-wishlist").click(function (e) {
    e.preventDefault();
    $(this).toggleClass('fa-eye-slash fa-eye');
    if ($(this).hasClass("fa-eye")) {
        $(".password-toggle-data").attr('type', 'text');
    } else {
        $(".password-toggle-data").attr('type', 'password');
    }
});

$("body").on('click', ".dropdown-toggle-custom-wishlist", function () {
/*    $(".dropdown-menu-custom").removeClass('show');
    $(".dropdown-menu-custom-wishlist").toggleClass('show');
    $(".nav-wishlist").toggleClass('show');
    $("body").toggleClass('modalOverley');*/
});
$("body").on('click', ".dropdown-toggle-custom-nav-wishlist", function () {
    console.log(123)
    $(".dropdown-menu-custom").removeClass('show');
    $(".nav-wishlist").toggleClass('show');
    $(".navbar-collapse").hide();
    $(".menu-close").hide();
    $(".menu-overley-hide").removeClass('menu-overley');
    $("#main-menu").removeClass('sticky-top');
});


$("body").on('click', ".dropdown-menu-custom-wishlist .close, .nav-wishlist .close", function () {
    $(".dropdown-menu-custom-wishlist").removeClass('show')
    $("body").removeClass('modalOverley');
    $("#main-menu").addClass('sticky-top');
});
$("body").on('click', ".nav-wishlist .close", function () {
    $(".nav-wishlist").removeClass('show');
});


// program menu active
$(".program-menu-item").click(function () {
    $(".program-menu-item").removeClass('active');
    $(this).addClass('active');
})

// review show more button
$(document).ready(function () {
    let showChar = 150;
    let ellipsestext = "...";
    let moretext = "see more";
    let lesstext = "see Less";
    $('.more').each(function () {
        let content = $(this).html();
        if (content.length > showChar) {
            let c = content.substr(0, showChar);
            let h = content.substr(showChar - 1, content.length - showChar);
            console.log(h)
            let html = c + '<span class="moreelipses">' + ellipsestext + '</span>&nbsp;<span class="morecontent"><span class="moreContent">' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';

            $(this).html(html);
        }

    });

    $(".morelink").click(function () {
        if ($(this).hasClass("less")) {
            $(this).removeClass("less");
            $(this).html(moretext);
        } else {
            $(this).addClass("less");
            $(this).html(lesstext);
        }
        $(this).prev().toggle();
        $(this).parent().prev().toggle();
        return false;
    });
});


// write review show
$(".show-write-review").click(function (e) {
    e.preventDefault();
    $(".write-text-area").show();
    $(this).hide();
})

// community owl-carousel
$('.community-section-owl-carousel').owlCarousel({
    loop: true,
    margin: 30,
    responsiveClass: true,
    responsive: {
        0: {
            items: 1,
            loop: true,
            nav: false
        },
        576: {
            items: 2,
            loop: true,
            nav: false
        },
        992: {
            items: 3,
            nav: false,
            loop: true,
            dots: true
        }
    }
})

// program owl-carousel
$('.carousal-main-content').owlCarousel({
    loop: true,
    margin: 30,
    responsiveClass: true,
    responsive: {
        0: {
            items: 1,
            loop: true,
            nav: false
        },
        576: {
            items: 2,
            loop: true,
            nav: false
        },
        768: {
            items: 2,
            nav: false,
            loop: true,
            dots: true
        },
        992: {
            items: 3,
            nav: true,
            loop: true,
            dots: false
        }
    }
})

//  featured-university-owl-carousel
$('.featured-university-owl-carousel').owlCarousel({
    loop: true,
    margin: 20,
    responsiveClass: true,
    responsive: {
        0: {
            items: 1,
            loop: true,
            nav: false
        },
        576: {
            items: 2,
            loop: true,
            nav: false
        },
        768: {
            items: 3,
            nav: false,
            loop: true,
            dots: true
        },
        992: {
            items: 4,
            nav: false,
            loop: true,
            dots: true
        }
    }
})

//  top-university-owl-carousel
$('.top-university-owl-carousel').owlCarousel({
    loop: true,
    margin: 20,
    responsiveClass: true,
    responsive: {
        0: {
            items: 1,
            loop: true,
            nav: false
        },
        576: {
            items: 2,
            loop: true,
            nav: false
        },
        768: {
            items: 3,
            nav: false,
            loop: true,
            dots: true
        },
        992: {
            items: 4,
            nav: false,
            loop: true,
            dots: true
        }
    }
})

//  country-owl-carousel
$('.country-owl-carousel').owlCarousel({
    loop: true,
    margin: 20,
    responsiveClass: true,
    // autoplay : 1000,
    responsive: {
        0: {
            items: 2,
            loop: true,
            nav: false
        },
        576: {
            items: 2,
            loop: true,
            nav: false
        },
        768: {
            items: 2,
            nav: false,
            loop: true,
            dots: false
        },
        992: {
            items: 2,
            nav: false,
            loop: true,
            dots: false
        }
    }
})


// discipline-section height
$(".height-show").click(function () {
    $(".discipline-item-container").css("max-height", "100%");
    $(".height-less").show();
    $(".height-show").hide();
})
$(".height-less").click(function () {
    $(".discipline-item-container").css("max-height", "450px");
    $(".height-show").show();
    $(".height-less").hide();
})


// menu jq start

$("body").on('click', ".navbar-toggler-icon", function () {
    $(".navbar-collapse").show();
    $(".menu-close").show();
    $(".menu-overley-hide").addClass('menu-overley');

})

$("body").on('click', ".menu-close", function () {
    $(".navbar-collapse").hide().fadeOut();
    $(".menu-close").hide();
    $(".menu-overley-hide").removeClass('menu-overley');
})

$("body").on('click', ".dropdown-toggle-custom-wishlist", function () {
    $(".navbar-collapse").hide();
    $(".menu-close").hide();
    $(".menu-overley-hide").removeClass('menu-overley');
    $("#main-menu").removeClass('sticky-top');

    $(".dropdown-menu-custom").removeClass('show');
    $(".dropdown-menu-custom-wishlist").toggleClass('show');
    $(".nav-wishlist").toggleClass('show');
    $("body").toggleClass('modalOverley');

})

$("body").on('click', ".menu-close-sm", function () {
    $(".dropdown-menu-custom-wishlist").removeClass('show');
    $("body").removeClass('modalOverley');
    $("#main-menu").addClass('sticky-top');

});

// menu jq end

// search input show
$("body").on('click', ".search-button", function (e) {
    e.preventDefault();
    $(".custom-show-lg-search").css({
        "width": "350px",
        "border-width": "1px",
    });
});

// search input hide tablet
$(document).mouseup(function (e) {
    let container = $(".custom-show-lg-search");

    if (!container.is(e.target) && container.has(e.target).length === 0) {
        $(".custom-show-lg-search").css({
            "border-width": "0",
            "width": "0",
        });
        $(".custom-show-lg-search").val("");

    }
});


// filter options start

let filterArray = [];

$("body").on('click', ".close-button", function () {
    let id = $(this).attr("data-id");
    filterArray = filterArray.filter(data => data.id !== id)
    showFilterList();
    $(`#${id}`).prop("checked", false);
})

$("body").on('click', ".clear-all-button", function () {
    filterArray = [];
    $('.check-mark').prop("checked", false);
    $('.selected-search-data').text("");
    $(".clear-all-button").hide();
})

$("body").on('click', ".check-mark", function () {

    if ($(this).prop("checked")) {
        let data = {
            id: $(this).attr("id"),
            value: $(this).val()
        }
        filterArray.push(data);
    } else {
        filterArray = filterArray.filter(data => data.id !== $(this).attr("id"))
    }


    $(".clear-all-button").show();
    $(".selected-search-data").show();
    showFilterList();
})

function showFilterList() {
    $('.selected-search-data').text("");
    filterArray.forEach((data, index) => {
        $('.selected-search-data').append(
            ` <div class="selected-data">
                <p>${data.value}</p>
                <span class="close-button" id="${index}" data-id="${data.id}">x</span>
            </div>
        `
        )
    })

    if (filterArray.length < 1) {
        $(".clear-all-button").hide();
    }
}

// filter options end

// mobile filter start

$("body").on('click', ".menu-close-filter,.close-filter", function () {
    $(".navbar-collapse").hide();
    $(".menu-close-filter").hide();
    $(".mobile-filter-section ").css("transform", "translateX(150%)");
    $(".menu-overley-hide").removeClass('menu-overley');
})

$("body").on('click', ".filter-img", function () {
    $(".menu-overley-hide").addClass('menu-overley');
    $(".mobile-filter-section ").css("transform", "translateX(0)");
    $(".menu-close-filter").show();

})

// mobile filter end


// matching tool start
$("body").on("click", ".matching-modal-button, .discipline-Modal-button", function (e) {
    e.preventDefault();
    $(".common-hide-section").hide()
    $(".study-level-section").show()
})

$("body").on("click", ".item-box", function () {
    $(this).closest('.item-box-content').find('.item-box').removeClass("active");
    $(this).addClass("active");
})
$("body").on("click", ".multiple-item-box", function () {
    $(this).toggleClass("active");
    $(".item-box-all").removeClass("active");
})
$("body").on("click", ".item-box-all", function () {
    $(this).closest('.item-box-content').find('.multiple-item-box').addClass("active");
})
$("body").on("click", ".work-year h5", function () {
    $('.work-year h5').removeClass("active");
    $(this).addClass("active");
})


//change language
$("body").on("click", ".language-change", function () {
    let lgcode=$(this).attr('data-languagecode');
    fetch('/locale/' + lgcode).then(response=>{
        location.reload();
    });
    $('.language-change').removeClass("active");
    $(this).addClass("active");
})

$("body").on("click", ".more-button", function () {
    if($(this).text() === "Less"){
        $(this).text("More");
        $(".work-year").css("width", "192px");
    }else{
        $(this).text("Less");
        $(".work-year").css("width", "100%");
    }
})

// matching tool end

// tooltip function
$(function () {
    $('[data-toggle="tooltip"]').tooltip()
})

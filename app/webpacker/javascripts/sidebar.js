
$( document ).on('turbolinks:load', function() {

    //submenus animation
    $(".sidebar-dropdown > a").click(function() {
        $(".sidebar-submenu").slideUp(200);
        if (
            $(this)
                .parent()
                .hasClass("active")
        ) {
            $(".sidebar-dropdown").removeClass("active");
            $(this)
                .parent()
                .removeClass("active");
        } else {
            $(".sidebar-dropdown").removeClass("active");
            $(this)
                .next(".sidebar-submenu")
                .slideDown(200);
            $(this)
                .parent()
                .addClass("active");
        }
    });

    // close sidebar
    $("#close-sidebar").click(function() {
        $(".side-wrapper").removeClass("toggled");
        $('.overlay').removeClass('active');
    });

    // show sidebar
    $("#show-sidebar").click(function() {
        $(".side-wrapper").addClass("toggled");
        $('.overlay').addClass('active');
    });


    // hide sidebar on overlay click
    $('.overlay').on('mouseup', function() {
        $(".side-wrapper").removeClass("toggled");
        $('.overlay').removeClass('active');
    });


});
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require turbolinks
//= require chosen-jquery

//= require popper
//= require bootstrap
//= require data-confirm-modal

//= require froala_editor.min.js

//=  require plugins/align.min.js
//=  require plugins/char_counter.min.js
//=  require plugins/code_beautifier.min.js
//=  require plugins/code_view.min.js
//=  require plugins/colors.min.js
//=  require plugins/emoticons.min.js
//=  require plugins/entities.min.js
//= require plugins/file.min.js
//= require plugins/font_family.min.js
//=  require plugins/font_size.min.js
//=  require plugins/fullscreen.min.js
//=  require plugins/help.min.js
//=  require plugins/image.min.js
//=  require plugins/image_manager.min.js
//=  require plugins/inline_style.min.js
//=  require plugins/line_breaker.min.js
//=  require plugins/link.min.js
//=  require plugins/lists.min.js
//=  require plugins/paragraph_format.min.js
//=  require plugins/paragraph_style.min.js
//=  require plugins/print.min.js
//=  require plugins/quick_insert.min.js
//=  require plugins/quote.min.js
//=  require plugins/save.min.js
//=  require plugins/table.min.js
//=  require plugins/special_characters.min.js
//=  require plugins/url.min.js
//=  require plugins/video.min.js

//= require messages

//=require "vendor/custom_scroll"


//sidebar js


$( document ).on('turbolinks:load', function() {
        $("#sidebar").mCustomScrollbar({
            theme: "minimal"
        });

        $('#dismiss, .overlay').on('click', function () {
            // hide sidebar
            $('#sidebar').removeClass('active');
            // hide overlay
            $('.overlay').removeClass('active');
        });

        $('#sidebarCollapse').on('click', function () {
            // open sidebar
            $('#sidebar').addClass('active');
            // fade in the overlay
            $('.overlay').addClass('active');
            $('.collapse.in').toggleClass('in');
            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
        });
})


$(document).click(function(e) {
	if (!$(e.target).is('.navbar')) {
    	$('.collapse').collapse('hide');
    }
});


dataConfirmModal.setDefaults({
  title: 'Potwierdź akcję',
  commit: 'Potwierdź',
  cancel: 'Anuluj'
});





// picture validate
$('#clan_picture').bind('change', function() {
  var size_in_megabytes = this.files[0].size/1024/1024;
  if (size_in_megabytes > 5) {
    alert('Maksymalny rozmiar pliku może wynosić 5MB. Proszę wybierz mniejszy plik.');
  }
});

//

$(document).ready(function(e) {
// navbar




// Hide Header on on scroll down
var didScroll;
var lastScrollTop = 0;
var delta = 5;
var navbarHeight = $('header').outerHeight();

$(window).scroll(function(event){
    didScroll = true;
});

setInterval(function() {
    if (didScroll) {
        hasScrolled();
        didScroll = false;
    }
}, 250);



function hasScrolled() {
    var st = $(this).scrollTop();

		if ($(this).scrollTop() <= 0){
            $('header').removeClass('header-dark');
            $('.share-buttons').removeClass('anim');

		}
    // Make sure they scroll more than delta
    if(Math.abs(lastScrollTop - st) <= delta)
        return;





    // If they scrolled down and are past the navbar, add class .nav-up.
    // This is necessary so you never see what is "behind" the navbar.
    if (st > lastScrollTop && st > navbarHeight){
        // Scroll Down
        $('header').removeClass('nav-down').addClass('header-dark nav-up');
        $('.share-buttons').addClass('anim');
    } else
        // Scroll Up
        if(st + $(window).height() < $(document).height()) {
                 $('header').removeClass('nav-up').addClass('nav-down');
                 $('.share-buttons').removeClass('anim');
			}

    lastScrollTop = st;
}
});




$(document).ready(function(e) {
    // navbar

    // Hide Header on on scroll down
    var didScroll;
    var lastScrollTop = 0;
    var delta = 5;
    var navbarHeight = $('header').outerHeight();

    $(window).scroll(function(event){
        didScroll = true;
    });

    setInterval(function() {
        if (didScroll) {
            $('.share-buttons').addClass('anim');
            hassScrolled();
            didScroll = false;

        }
    }, 250);



    function hassScrolled() {
        var st = $(this).scrollTop();

            if ($(this).scrollTop() <= 0){

                $('.share-buttons').removeClass('anim');

            }
        // Make sure they scroll more than delta
        if(Math.abs(lastScrollTop - st) <= delta)
            return;





        // If they scrolled down and are past the navbar, add class .nav-up.
        // This is necessary so you never see what is "behind" the navbar.
        if (st > lastScrollTop && st > navbarHeight){
            // Scroll Down


        } else
            // Scroll Up
            if(st + $(window).height() < $(document).height()) {
                $('.share-buttons').removeClass('anim');

                }

        lastScrollTop = st;
    }
    });

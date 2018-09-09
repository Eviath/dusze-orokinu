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

//= require rails-ujs
//= require turbolinks
//= require_tree .

//= require jquery3
//= require popper
//= require bootstrap
//= require data-confirm-modal


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
		}
    // Make sure they scroll more than delta
    if(Math.abs(lastScrollTop - st) <= delta)
        return;





    // If they scrolled down and are past the navbar, add class .nav-up.
    // This is necessary so you never see what is "behind" the navbar.
    if (st > lastScrollTop && st > navbarHeight){
        // Scroll Down
        $('header').removeClass('nav-down').addClass('header-dark nav-up');
    } else
        // Scroll Up
        if(st + $(window).height() < $(document).height()) {
 				$('header').removeClass('nav-up').addClass('nav-down');
			}

    lastScrollTop = st;
}
});


// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// core
import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';
import 'jquery'
import $ from 'jquery';
global.$ = jQuery;
global.jQuery = $;
import 'bootstrap/dist/js/bootstrap';
import * as ActiveStorage from "activestorage";
// app stylesheets

import "./stylesheets"
import "../javascripts/direct_upload.js"
import "chosen-js"


// fire up
ActiveStorage.start();

//summernote
import "summernote/dist/summernote-bs4";
import "summernote/dist/lang/summernote-pl-PL"



$(document).on('ready turbolinks:load', function() {
    jQuery('#summernote').summernote({
        lang: 'pl-PL', // default: 'en-US'
        prettifyHtml: false,
        height: 500,   //set editable area's height
        codemirror: { // codemirror options
            theme: '3024-day'
        },
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Marcellus SC'],
        toolbar: [
            ['style', ['style']],
            ['fontsize', ['fontsize']],
            ['font', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
            ['fontname', ['fontname']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert', ['picture', 'hr', 'link', 'video']],
            ['table', ['table']],
            ['misc', ['fullscreen', 'codeview']]
        ],
        fontSizes: ['8', '9', '10', '11', '12', '14', '18', '24', '36', '48' , '64', '82', '150'],
    });
});

function sendFile(upload_path, file, toSummernote) {
    var data;
    data = new FormData;
    data.append('upload[asset]', file);
    $.ajax({
        data: data,
        type: 'POST',
        url: upload_path,
        cache: false,
        contentType: false,
        processData: false,
        success: function(data) {
            console.log('file uploading...');
            if (typeof data.errors !== 'undefined' && data.errors !== null) {
                console.log('ops! errors...');
                return $.each(data.errors, function(key, messages) {
                    return $.each(messages, function(key, message) {
                        return alert(message);
                    });
                });
            } else {
                console.log('inserting image in to editor...');
                return toSummernote.summernote('insertImage', data.url);
            }
        }
    });
}

import Swal from 'sweetalert2'
const confirmed = (element, result) => {
    if (result.value) {
        // User clicked confirm button
        element.removeAttribute('data-confirm-swal');
        element.click()
    }
};

// Display the confirmation dialog
const showConfirmationDialog = (element) => {
    const message = element.getAttribute('data-confirm-swal');
    const text = element.getAttribute('data-text');

    Swal.fire({
        title: message || 'Jesteś pewny?',
        text: text || '',
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Tak',
        cancelButtonText: 'Anuluj',
    }).then(result => confirmed(element, result))
};

const allowAction = (element) => {
    if (element.getAttribute('data-confirm-swal') === null) {
        return true
    }

    showConfirmationDialog(element);
    return false
};

function handleConfirm(element) {
    if (!allowAction(this)) {
        Rails.stopEverything(element)
    }
}


Rails.delegate(document, 'a[data-confirm-swal]', 'click', handleConfirm);




Rails.start();
Turbolinks.start();

//import custom scripts
import '../javascripts/sidebar'

// close alert toast
function closeToast() {
    $('#toast').hide();
}
window.closeToast = closeToast;




// Clan recruitment check status message under checkbox field
$(document).ready(function() {

    //  on page load
    if ($('#recruitment-check').prop('checked')) {
        $('#recruitment-check-status').html('Klan prowadzi rekrutację.').css('color', 'green'); //checked by default
    }else {
        $('#recruitment-check-status').html('Klan nie prowadzi obecnie rekrutacji.').css('color', 'red'); //not checked
        }


    // on change
    $('#recruitment-check').change(function() {
        if ($(this).prop('checked')) {
            $('#recruitment-check-status').html('Klan prowadzi rekrutację.').css('color', 'green'); //checked
        }
        else {
            $('#recruitment-check-status').html('Klan nie prowadzi obecnie rekrutacji.').css('color', 'red'); //not checked
        }
    });
});



// enable bootstrap tooltips
$(document).on('turbolinks:load', function () {
    $('[data-toggle="tooltip"]').tooltip()
});


// navbar hide collapse
$(document).click(function (e) {
    if (!$(e.target).is('.navbar')) {
        $('.collapse').collapse('hide');
    }
});


// Bootstrap modal confirm setup



$(document).ready(function() {
$('.chosen-select').chosen({
    no_results_text: "Nie znaleziono",
    placeholder_text_multiple: 'Wybierz odbiorców wiadomości.',
    width: '200px'
});
});





//shared links and navbar animation on scroll load with turbolinks
$(document).on('turbolinks:load', function () {

    let c, currentScrollTop = 0,
        navbar = $('header');
    const social = $('.share-buttons');

    $(window).scroll(function () {
        const a = $(window).scrollTop();
        const b = navbar.height();

        currentScrollTop = a;


        if (c < currentScrollTop && a > b + b) {
            //scroll down
            navbar.removeClass("header-dark").addClass("nav-up");
            social.addClass('anim');
        } else if (c > currentScrollTop && !(a <= b)) {
            //scroll up
            navbar.addClass("header-dark").removeClass("nav-up");
            social.removeClass('anim');
        } else if ($(this).scrollTop() <= 0) {
            //scrolled to top
            navbar.removeClass('header-dark');
            social.removeClass('anim');
        }
        c = currentScrollTop;
    });

});


$(document).on('turbolinks:load', function () {
// scroll mailboxer messages to bottom
    const elem = document.getElementById('messages');
    if (elem) {
        elem.scrollTop = elem.scrollHeight
    }
});




//moving background
var lFollowX = 0,
    lFollowY = 0,
    x = 0,
    y = 0,
    friction = 1 / 30;

function moveBackground() {
    x += (lFollowX - x) * friction;
    y += (lFollowY - y) * friction;

    const translate = 'translate(' + x + 'px, ' + y + 'px) scale(1.1)';

    $('#eidolons-page').css({
        '-webit-transform': translate,
        '-moz-transform': translate,
        'transform': translate
    });

    window.requestAnimationFrame(moveBackground);
}

$(window).on('mousemove click', function(e) {

    var lMouseX = Math.max(-100, Math.min(100, $(window).width() / 2 - e.clientX));
    var lMouseY = Math.max(-100, Math.min(100, $(window).height() / 2 - e.clientY));
    lFollowX = (20 * lMouseX) / 100; // 100 : 12 = lMouxeX : lFollow
    lFollowY = (10 * lMouseY) / 100;

});

moveBackground();


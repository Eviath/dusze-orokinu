/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';

import 'jquery'
import 'bootstrap/dist/js/bootstrap';

// application stylesheets
import "./stylesheets"
//bootstrap confirm modal
import "data-confirm-modal"
//better choose form input
import "chosen-js"
// WYSIWYG editor for clan/request/news
import { tinyMce} from "../javascripts/tinyMce";

// app/javascript/packs/application.js
import * as ActiveStorage from "activestorage";
import "../javascripts/direct_upload.js"

ActiveStorage.start();

// fire up rails-ujs and turbolinks
Rails.start();
Turbolinks.start();

import $ from 'jquery';

global.$ = jQuery;

tinyMce();


//import custom scripts
import '../javascripts/sidebar'




// enable bootstrap tooltips
$( document ).on('turbolinks:load', function() {
    $('[data-toggle="tooltip"]').tooltip()
});


// navbar hide collapse
$(document).click(function(e) {
    if (!$(e.target).is('.navbar')) {
        $('.collapse').collapse('hide');
    }
});


// Bootstrap modal confirm setup
dataConfirmModal.setDefaults({
    title: 'Potwierdź swoją akcję',
    commit: 'Potwierdź',
    cancel: 'Anuluj'
});



$('.chosen-select').chosen({
    no_results_text: "Nie znaleziono",
    placeholder_text_multiple: 'Wybierz odbiorców wiadomości.',
    width: '200px'
});


//shared links and navbar animation on scroll load with turbolinks
$( document ).on('turbolinks:load', function() {

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


$( document ).on('turbolinks:load', function() {
// scroll mailboxer messages to bottom
    const elem = document.getElementById('messages');
    if (elem) {
        elem.scrollTop = elem.scrollHeight
    }
});


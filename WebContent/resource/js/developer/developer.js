// developer js

$(document).ready(function(){
	$('#nav-developer').addClass('active');
});

$(function() {
    $('a[href^="#"]').click(function() {    // Change to needed selector
        $("html, body").animate({    // Need both for full browser support
            scrollTop: $( $(this).attr("href") ).offset().top // Extra 100px
        }, 300);    // Change to desired scroll time in ms
        return false;    // Prevents the dreaded jump/flash
    });
});
$(document).ready(function() {
	$("#home").click(function() {
	    $('html, body').animate({
	        scrollTop: $("#home-section").offset().top
	    }, 800);
	    console.log ( '#someButton was clicked' );
	});
	$("#tim").click(function() {
	    $('html, body').animate({
	        scrollTop: $("#tim-section").offset().top -100
	    }, 800);
	});
	$("#run").click(function() {
	    $('html, body').animate({
	        scrollTop: $("#run-section").offset().top -100
	    }, 800);
	});
	$("#register").click(function() {
	    $('html, body').animate({
	        scrollTop: $("#register-section").offset().top -100
	    }, 800);
	});
});
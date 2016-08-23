$(document).ready(function() {
  $("#pour").delay(800).slideDown("slow", function() {
  	$("#milk").animate({height: '250px'}, 1600, function() {
  		$("#pour").slideUp("slow", function() {
  			$("#syrup").slideDown(800, function() {
  				$("#syrup").slideUp(700, function() {
  					$("#straw").animate({left: '100px'}, function() {
  						$("#straw").animate({left: '40px'}, function() {
	  						$("#straw").animate({left: '100px'}, function() {
		  						$("#straw").animate({left: '40px'}, function() {
			  						$("#milk").animate({backgroundColor: '#593407'}, 1200);
			  					});
		  					});
	  					});
  					});
  				});
  			});
  		});
  	});
  });
});


$(document).ready(function(){

	$('#add_participant').click(function(){
		var last_id = $('#participants').children('div').last().attr('id').replace('participant_', '');
		console.log(last_id);
		var form = $('#participants').children('div').last().clone();
		form.html( String(form.html().replace( new RegExp( '\\['+last_id+'\\]' , 'g'), '['+(parseInt(last_id)+1)+']') ) );
		form.css('display','none');
		form.attr('id', 'participant_'+ (parseInt(last_id)+1)) ;
		$('#participants').children().last().after(form);
		$('#participants').children().last().slideDown(350);
		event.preventDefault()

		$('.remove_participant').click(function(){
			var participant = $(this).parent().parent();
			if (participant.siblings('div').length != 0 ){
				participant.slideUp(350,function(){
					participant.remove();
				});
			}
		});
	});

	$('.remove_participant').click(function(){
		var participant = $(this).parent().parent();
		if (participant.siblings('div').length != 0 ){
			participant.slideUp(350,function(){
				participant.remove();
			});
		}
	});

	if ($('#error_explanation').length){
    $('html, body').animate({
        scrollTop: $("#register-section").offset().top
    }, 800);
	}

})

$(document).ready(function(){
	$('#add_participant').click(function(){
		var last_id = $('#participants').children().last().attr('id').replace('participant_', '');
		console.log(last_id);
		var form = $('#participants').children().last().clone();
		form.html( String(form.html().replace( new RegExp( '\\['+last_id+'\\]' , 'g'), '['+(parseInt(last_id)+1)+']') ) );
		form.css('display','none');
		form.attr('id', 'participant_'+ (parseInt(last_id)+1)) ;
		$('#participants').children().last().after(form);
		$('#participants').children().last().slideDown(350);
		event.preventDefault()
		$('.remove_participant').click(function(){
			var participant = $(this).parent().parent();
			if (participant.siblings().length != 0 ){
				participant.slideUp(350,function(){
					participant.remove();
				});
			}
		});
	});

	$('#additional_shirts').click(function(){
		$('#shirt_order').slideDown(350);
		$('#shirt_buttons').addClass('has-addons');
		$('#hide_shirts').animate({opacity: 1},500,'swing',function(){});
	});

	$('#hide_shirts').click(function(){
		$('#shirt_order').slideUp(350);
		$('#hide_shirts').animate({opacity: 0},500,'swing',function(){
			$('#shirt_buttons').removeClass('has-addons');
		});
	});

	$('.remove_participant').click(function(){
		var participant = $(this).parent().parent();
		if (participant.siblings().length != 0 ){
			participant.slideUp(350,function(){
				participant.remove();
			});
		}
	});
})
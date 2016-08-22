$(document).ready(function(){
	$('#add_participant').click(function(){
		var last_id = $('#participants').children().last().attr('id').replace('participant_', '');
		console.log(last_id);
		var form = $('#participants').children().last().clone();
		form.html( String(form.html().replace( new RegExp( '\\[['+last_id+']\\]' , 'g'), '['+(parseInt(last_id)+1)+']' ) ) );
		form.attr('id', 'participant_'+ (parseInt(last_id)+1)) ;
		console.log(new RegExp( '\\[['+last_id+']\\]' , 'g'));
		$('#participants').children().last().after(form);
		event.preventDefault()
	});
})
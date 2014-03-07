$(function(){

	//add messages to the chatroom
	$('.add-message').on('submit', function(event){
		event.preventDefault();

		var url = $(this).attr('action');
		var data = $(this).serialize();

		$.post(url, data, function(serverResponse){
			$('.chat-box > ul:last-child').append(serverResponse);
			$('.type-message').val('');
		});
	});

	//Submit with ctrl+enter && cmd+enter
	$('.add-message').on('keydown', function(event){
		// console.log(event.keyCode)
		if (event.keyCode == 13 && (event.metaKey || event.ctrlKey))
			$(this).submit();

	})



});
$(function(){

//Scroll to bottom of chat-box
	function scrollToBottom(){
		$('.chat-box').scrollTop($('.chat-box')[0].scrollHeight);
	}
	scrollToBottom();

//Submit with ctrl+enter && cmd+enter
	$('.add-message').on('keydown', function(event){
		if (event.keyCode == 13 && (event.metaKey || event.ctrlKey))
			$(this).submit();
	});

//add messages to the chatroom
	$('.add-message').on('submit', function(event){
		event.preventDefault();

		var url = $(this).attr('action');
		var data = $(this).serialize();

		$.post(url, data, function(serverResponse){
			$('.chat-box > ul:last-child').append(serverResponse);
			$('.type-message').val('');
			scrollToBottom();
		});

		
	});


});
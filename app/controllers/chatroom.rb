get '/new/chatroom' do 
	erb :create_chatroom
end

get '/chatroom/:chat_id' do 
	@chatroom = Chatroom.find(params[:chat_id])
	erb :chatroom
end

get '/chatroom/:chat_id/delete' do
	chatroom = Chatroom.find(params[:chat_id])
	chatroom.destroy

	redirect "/profile/#{session[:current_user]}"

end

get '/chatroom/:chat_id/clear' do 
	chatroom = Chatroom.find(params[:chat_id])
	chatroom.messages.destroy_all

	redirect "/chatroom/#{chatroom.id}"
end




#POST===========================================


post '/new/chatroom' do 
	user = User.find(session[:current_user])
	chatroom = Chatroom.new(params[:chatroom])

	user.chatrooms << chatroom

	redirect "/chatroom/#{chatroom.id}"
end

post '/new/chatroom/message' do 
	user = User.find(session[:current_user])
	chatroom = Chatroom.find(params[:chat_id])
	message = Message.new(content: params[:message])

	user.messages << message
	chatroom.messages << message

	redirect "/chatroom/#{chatroom.id}"
end
get '/' do
	@chatrooms = Chatroom.where(public?: true)
	
  erb :index
end



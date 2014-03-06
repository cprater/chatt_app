get '/' do
	@chatrooms = Chatroom.where(public?: true)
	# binding.pry
  erb :index
end



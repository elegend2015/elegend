class MessagesController < ApplicationController
	def index
      @users = User.all 
    	@messages = Message.all
  	end

  	def create
    	@message = Message.create!(chat_params)
  	end

	private

  	def chat_params
    	params.require(:message).permit(:user_id , :content)
  	end
end

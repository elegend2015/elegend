class MessagesController < ApplicationController
	def index
    	@messages = Message.all
  	end

  	def create
    	@message = Message.create!(chat_params)
  	end

	private

  	def chat_params
    	params.require(:message).permit(:content)
  	end
end

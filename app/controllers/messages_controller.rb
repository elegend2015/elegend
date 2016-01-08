class MessagesController < ApplicationController
	  def index
      @users = User.all_except(current_user)
  	end

  	def create
    	@message = Message.new(msg_params)
      @message.save
      redirect_to :back
  	end

    def message
      @users = User.all_except(current_user)
      @messages1 = Message.where(:user_id =>current_user.id, :friend_id => params["friend_id"])
      @messages2 = Message.where(:user_id =>params["friend_id"], :friend_id=>current_user.id)
      @messages = @messages1.union_all(@messages2).order('created_at')
      @frnd = User.find(params[:friend_id])
    end

	private

  	def msg_params
    	params.require(:message).permit(:user_id , :friend_id, :content)
  	end
end

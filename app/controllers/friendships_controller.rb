class FriendshipsController < ApplicationController
	def create
	  @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
	  frnd = User.find(params[:friend_id])
	  @friendship2 = frnd.friendships.build(:friend_id => current_user.id)
	  @friendship.status = "1"
	  @friendship2.status = "3"
	  if @friendship.save
	  	@friendship2.save
	    flash[:notice] = "Added friend."	
	    redirect_to :back
	  else
	    flash[:error] = "Unable to add friend."
	    redirect_to root_url
	  end
	end

	def friend_accept
		@friendship = Friendship.where(:friend_id => current_user.id, :user_id => params["friend_id"])
		@friendship2 = Friendship.where(:friend_id => params["friend_id"], :user_id => current_user.id)
		@friendship[0].status = 2
		@friendship[0].save
		@friendship2[0].status = 2
		@friendship2[0].save
		redirect_to :back
	end

	def destroy
	  @friendship = current_user.friendships.find(params[:id])
	  @friendship.destroy
	  flash[:notice] = "Removed friendship."
	  redirect_to :back
	end
end

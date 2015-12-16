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
	    redirect_to profile_user_details_path(:id => current_user.id)
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

	def destroy_friendship
	  @friendship4 = Friendship.where(:friend_id => current_user.id, :user_id => params["friend_id"])
	  @friendship5 = Friendship.where(:friend_id => params["friend_id"], :user_id => current_user.id)
	  @friendship4[0].destroy
	  @friendship5[0].destroy
	  flash[:notice] = "Removed friendship."
	  redirect_to :back
	end
end

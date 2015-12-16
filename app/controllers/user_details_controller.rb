class UserDetailsController < ApplicationController
	
	def edit
		@user = current_user
	end

	def update_user
		@user = current_user
		@user.addr = params[:addr]
		@user.phone = params[:phone]
		@user.gender = params[:gender]
		@user.status = params[:status]
		@user.about = params[:about]
		@user.save
		
		redirect_to :back

	end

	def update_pic
		@user = current_user
		@user.profile_pic = params[:profile_pic]
		@user.save
      	redirect_to :back
	end

	def profile
		@user = User.find(params[:id])
		@users = User.all_except(current_user)
	    @genres = Genre.all
	    @channels = Channel.all
	    @friends_rq_sent = Friendship.where(:user_id => @user.id, :status => 1)
	    @friends_rq_recieved = Friendship.where(:user_id => @user.id, :status => 3)
	    @friends = Friendship.where(:user_id => @user.id, :status => 2)
	end

	def gallery
		@channels = Channel.all.order('created_at DESC')
	    #@user_id = current_user.id
	    #@pictures = Gallery.find(params[:user_id => current_user.id])
	    #@pictures = Gallery.find_by_user_id(current_user.id)
	    @user = User.find(params[:id])
	    @pictures = Gallery.where(:user_id => @user.id)
	end

	def gallery_pic
		@gpic = Gallery.new
		@gpic.user_id = current_user.id
		@gpic.pic = params[:pic]
		@gpic.save
      	redirect_to :back
	end

	def del_gallery_pic
		@g_id = Gallery.find(params[:format])
		@g_id.destroy!
		redirect_to :back
	end

	def pannel_pic
		@ppic = Pannel.new
		@ppic.user_id = current_user.id
		@ppic.pannel_title = params[:pannel_title]
		@ppic.pannel_img = params[:pannel_img]
		@ppic.save
      	redirect_to :back
	end

	def del_pannel_pic
		@p_id = Pannel.find(params[:format])
		@p_id.destroy!
		redirect_to :back
	end
	
end

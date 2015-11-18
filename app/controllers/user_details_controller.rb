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

	def gallery_pic
		@gpic = Gallery.new
		@gpic.user_id = current_user.id
		@gpic.pic = params[:pic]
		@gpic.save
      	redirect_to :back
	end
	
end

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

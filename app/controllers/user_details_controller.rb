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
	
end

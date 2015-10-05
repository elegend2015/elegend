class StaticPagesController < ApplicationController
  
  def index

  end

  def profile
  	
  	@users = User.all_except(current_user)
  end

  def terms_of_service 

  end

  def demo
  	render :layout => 'demo'
  end


  
end

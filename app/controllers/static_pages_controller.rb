class StaticPagesController < ApplicationController
  
  def index

  end

  def profile
  	@users = User.all_except(current_user)
  end
  
end

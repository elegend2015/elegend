class StaticPagesController < ApplicationController
  
  def index

  end

  def profile
  	@search = User.search do
    fulltext params[:search]
 	end
  	@users = @search.results
  	#@users = User.all_except(current_user)
  end

  def demo
  	render :layout => 'demo'
  end
  
end

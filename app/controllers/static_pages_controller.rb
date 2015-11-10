class StaticPagesController < ApplicationController
  
  def index
    @feeds = Newsfeed.all
    @feeds = Newsfeed.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end

  def profile
  	@users = User.all_except(current_user)
    @genres = Genre.all
    @channels = Channel.all
  end

  def terms_of_service 

  end

  def demo
  	render :layout => 'demo'
  end


  
end

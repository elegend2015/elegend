class StaticPagesController < ApplicationController
  
  def index
    @pannels = Pannel.all.order('created_at DESC')
    @feeds = Newsfeed.all
    @feeds = Newsfeed.paginate(:page => params[:page], :per_page => 10).order('updated_at DESC')
  end

  def profile
    @pannels = Pannel.all.order('created_at DESC')
  	@users = User.all_except(current_user)
    @genres = Genre.all
    @channels = Channel.all
  end

  def terms_of_service 

  end

  def demo
  	render :layout => 'demo'
  end

  def gallery
    @pannels = Pannel.all.order('created_at DESC')
    #@user_id = current_user.id
    #@pictures = Gallery.find_by_user_id(current_user.id)
    @pictures = Gallery.all
  end
  
end

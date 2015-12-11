class StaticPagesController < ApplicationController
  
  def index
    @pannels = Pannel.all.order('created_at DESC')
    @channels = Channel.all.order('created_at DESC')
    @feeds = Newsfeed.all
    @feeds = Newsfeed.paginate(:page => params[:page], :per_page => 10).order('updated_at DESC')
  end

  def profile
  	@users = User.all_except(current_user)
    @genres = Genre.all
    @channels = Channel.all
    @friends_rq_sent = Friendship.where(:user_id => current_user.id, :status => 1)
    @friends_rq_recieved = Friendship.where(:user_id => current_user.id, :status => 3)
    @friends = Friendship.where(:user_id => current_user.id, :status => 2)
  end

  def terms_of_service 

  end

  def demo
  	render :layout => 'demo'
  end

  def gallery
    @channels = Channel.all.order('created_at DESC')
    #@user_id = current_user.id
    #@pictures = Gallery.find(params[:user_id => current_user.id])
    #@pictures = Gallery.find_by_user_id(current_user.id)
    @pictures = Gallery.all
  end
  
end

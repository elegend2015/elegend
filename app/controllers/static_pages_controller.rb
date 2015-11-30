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
    @friends_rq_sent = Friendship.where(:user_id => current_user.id)
    @friends_all_1 = Friendship.where(:user_id => current_user.id, :status => 2)
    @friends_all_2 = Friendship.where(:friend_id => current_user.id, :status => 2)
    @friends_all =  @friends_all_1.merge(@friends_all_2)
  end

  def terms_of_service 

  end

  def demo
  	render :layout => 'demo'
  end

  def gallery
    @pannels = Pannel.all.order('created_at DESC')
    #@user_id = current_user.id
    #@pictures = Gallery.find(params[:user_id => current_user.id])
    #@pictures = Gallery.find_by_user_id(current_user.id)
    @pictures = Gallery.all
  end
  
end

class StaticPagesController < ApplicationController
  
  def index
    @pannels = Pannel.all.order('created_at DESC')
    @channels = Channel.all.order('created_at DESC')
    @feeds = Newsfeed.all
    @feeds = Newsfeed.paginate(:page => params[:page], :per_page => 10).order('updated_at DESC')
  end

  def terms_of_service 

  end

  def demo
  	render :layout => 'demo'
  end
  
end

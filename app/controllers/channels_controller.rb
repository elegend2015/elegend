class ChannelsController < ApplicationController
  def index
  	@channel_post= ChannelPost.all
  end

  def new
  	@channel= Channel.new
  end

  def create
  	@channel = Channel.new(channel_params)
  	@channel.save
  	redirect_to @channel
  end

  def show
  	@channel = Channel.find(params[:id])
  	@channel_posts = ChannelPost.where(:channel_id => @channel.id)
  end

  def create_new_post
  	@channel_post= ChannelPost.new
  	@channel_post.channel_id = params[:channel_id]
  	@channel_post.user_id = current_user.id
  	@channel_post.comment= params[:comment]
  	@channel_post.save
  	redirect_to :back
  end

  private
  def channel_params
  	params.require(:channel).permit(:name, :description, :channel_type) 	
  end
end

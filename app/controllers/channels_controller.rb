class ChannelsController < ApplicationController
  def index
    @channels = Channel.all.order('created_at DESC')
  	if params[:search]
      @channels = Channel.search(params[:search]).order("created_at DESC")
    else
      @channels = Channel.all.order('created_at DESC')
    end
  end

  def new
  	@channel= Channel.new
  end

  def create
  	@channel = Channel.new(channel_params)
  	@channel.save
  	redirect_to @channel
  end

  def edit
    @channel = Channel.find(params[:id])
  end

  def show
  	@channel = Channel.find(params[:id])
  	@channel_posts = ChannelPost.where(:channel_id => @channel.id)
    @fol = ChannelFollow.where(:user_id => current_user.id, :channel_id => @channel.id)
  end

  def update
    @channel = Channel.find(params[:id])
    @channel.update(channel_params)
    redirect_to channel_path
  end

  def delete_channel
    @channel = Channel.find(params[:id])
    @channel.destroy!
    @channel_post = ChannelPost.where(:channel_id => @channel.id)
    @channel_post.each do |cp|
      cp.destroy!
    end
    @channel_fol = ChannelFollow.where(:channel_id => @channel.id)
    @channel_fol.each do |cf|
      cf.destroy!
    end
    
    redirect_to @channel
  end

  def create_new_post
  	@channel_post= ChannelPost.new
  	@channel_post.channel_id = params[:channel_id]
  	@channel_post.user_id = current_user.id
  	@channel_post.comment= params[:comment]
  	@channel_post.save
  	redirect_to :back
  end

  def follow
    @follow = ChannelFollow.new
    @follow.user_id = current_user.id
    @follow.channel_id = params[:channel_id]
    @follow.save
    redirect_to :back
  end

  def unfollow
    @unfollow = ChannelFollow.where(:user_id => current_user.id, :channel_id => params["channel_id"])
    @unfollow[0].destroy!
    redirect_to :back
  end

  private
  def channel_params
  	params.require(:channel).permit(:name, :description, :channel_type, :channel_img, :user_id) 	
  end
end

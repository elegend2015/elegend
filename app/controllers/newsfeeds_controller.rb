class NewsfeedsController < ApplicationController
	# def index
 #    	@feeds = Newsfeed.all
 #  	end

  	def create
    	@feed = Newsfeed.create!(feed_params)
      redirect_to :back
  	end

  	def show
  		@newsfeed = Newsfeed.find(params[:id])
  	end

    def edit
      @newsfeed = Newsfeed.find(params[:id])
    end

    def update
      @newsfeed = Newsfeed.find(params[:id])
      @newsfeed.update(feed_params)    
      redirect_to index_path
    end

	private

  	def feed_params
    	params.require(:newsfeed).permit(:post, :feed_title, :image, :user_id)
  	end
end

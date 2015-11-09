class NewsfeedsController < ApplicationController
	# def index
 #    	@feeds = Newsfeed.all
 #  	end

  	def create
    	@feed = Newsfeed.create!(feed_params)
  	end

  	def show
  		
  	end

	private

  	def feed_params
    	params.require(:newsfeed).permit(:post, :feed_title)
  	end
end

class NewsfeedsController < ApplicationController
	# def index
 #    	@feeds = Newsfeed.all
 #  	end

  	def create
    	@feed = Newsfeed.create!(feed_params)
  	end

	private

  	def feed_params
    	params.require(:newsfeed).permit(:post)
  	end
end

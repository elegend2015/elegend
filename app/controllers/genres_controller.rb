class GenresController < ApplicationController
  def index
  end

  def new
  	 @genre = Genre.new
  end

  def create
  	@genre = Genre.new(genre_params)
  	@genre.save
  	redirect_to profile_path
  end

  private

  def genre_params
  	params.require(:genre).permit(:name, :description, :img)
  end
end

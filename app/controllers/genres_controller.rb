class GenresController < ApplicationController
  
  def new
  	 @genre = Genre.new
  end

  def edit
     @genre = Genre.find(params[:id])
  end
  
  def show
     @genres =Genre.all
    @genre = Genre.find(params[:id])
  end

  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
  	   redirect_to @genre
    end
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    
    redirect_to @genre
  end

  private

  def genre_params
  	params.require(:genre).permit(:name, :description, :img)
  end
end

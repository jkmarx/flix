class MoviesController < ApplicationController
  def index
    @movies =  Movie.released()
  end

  def destroy
    @movie = Movie.find(params[:id]) # unnecessary to use instance but for consistency
    @movie.destroy
    redirect_to movies_url, status: :see_other
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.create(movie_params)
    redirect_to @movie
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to @movie
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :released_on, :rating, :total_gross)
  end

end

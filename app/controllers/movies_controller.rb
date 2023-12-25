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
    if @movie.save
      redirect_to @movie
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :released_on, :rating, :total_gross, :director, :duration, :image_file_name)
  end

end

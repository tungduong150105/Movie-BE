class MoviesController < ApplicationController
  skip_before_action :authenticate

  def index
    @movies = Movie.all
    render json: @movies
  end

  def create
    @new_movie = Movie.new(movie_params)
    if @new_movie.save
      render json: { message: 'Movie created successfully' }, status: :created
    else
      render json: { message: 'Error' }, status: :bad_request
    end
  end

  private

  def movie_params
    params.permit(:title, :description, :image_url)
  end
end

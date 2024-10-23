class Api::V1::MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: movies, each_serializer: MovieSerializer
  end

  def show
    current_id = params[:id]
    movie = Movie.find_by(id: current_id)
    if movie
      render json: movie, serializer: MovieSerializer
    else
      render json: { error: "Movie not found" }, status: :not_found
    end
  end
end

class Api::V1::MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: {
      "movie":  movies.as_json(include: {
       reviews: { only: %i[comment rating] }
     })
   }
  end

  def show
    current_id = params[:id]
    movie = Movie.find_by(id: current_id)

    if !movie
      render json: { message: "Movie not found" }, status: :unprocessable_entity
    else
      render json: {
         "movie":  movie.as_json(include: {
          reviews: { only: %i[comment rating] }
        })
      }
    end
  end
end

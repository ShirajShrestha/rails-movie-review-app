class MoviesController < ApplicationController
  def index
    api_key = ENV["API_KEY"]
    movie_list = JSON.parse(HTTP.get("https://api.themoviedb.org/3/movie/top_rated?&page=1&api_key=#{api_key}"))
    @movies = movie_list["results"]
  end

  def show
    id = params[:id]
    api_key = ENV["API_KEY"]

    @movie = Movie.find_by(tmdb_id: id)


    if @movie.nil?
      begin
        response = HTTP.get("https://api.themoviedb.org/3/movie/#{id}?language=en-US&api_key=#{api_key}")
        if response.status.success?
          movie_details = JSON.parse(response.body.to_s)

          @movie = Movie.create(
            tmdb_id: movie_details["id"],
            imdb_id: movie_details["imdb_id"],
            original_title: movie_details["original_title"],
            overview: movie_details["overview"],
            backdrop_path: movie_details["backdrop_path"],
            poster_path: movie_details["poster_path"],
            homepage: movie_details["homepage"],
            budget: movie_details["budget"],
            release_date: movie_details["release_date"],
            runtime: movie_details["runtime"],
            status: movie_details["status"],
            vote_average: movie_details["vote_average"]
            )
        else
            flash[:error] = "Movie not found in API"
            redirect_to movies_path and return
        end
        rescue => e
          flash[:error] = "Failed to fetch movie details: #{e.message}"
          redirect_to movies_path and return
        end
    end
      @reviews = Review.where(movie_id: @movie.id)
  end


  private
  def show_params
  end
end

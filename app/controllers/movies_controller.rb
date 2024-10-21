class MoviesController < ApplicationController
  def index
    api_key = ENV["API_KEY"]
    movie_list = JSON.parse(HTTP.get("https://api.themoviedb.org/3/movie/top_rated?&page=1&api_key=#{api_key}"))
    @movies = movie_list["results"]
  end

  def show
    id = params[:id]
    api_key = ENV["API_KEY"]

    if !Movie.find_by(tmdb_id: id)
      movie_details = JSON.parse(HTTP.get("https://api.themoviedb.org/3/movie/#{id}?language=en-US&api_key=#{api_key}"))

      Movie.create(
        tmdb_id: movie_details["tmdb_id"],
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
        vote_average: movie_details["vote_average"],
      )
      @movie = movie_details
    else
      @movie = Movie.find_by(tmdb_id: id)
    end


    movie_details = JSON.parse(HTTP.get("https://api.themoviedb.org/3/movie/#{id}?language=en-US&api_key=#{api_key}"))
    @movie =  movie_details
  end

  private
  def show_params
  end
end

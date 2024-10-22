class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if !@review.save
      render :new
    end

    if @review.save
      redirect_to movie_path(@review.movie.tmdb_id)
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :user_id, :movie_id)
  end
end

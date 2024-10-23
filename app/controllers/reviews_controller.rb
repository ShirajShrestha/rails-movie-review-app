class ReviewsController < ApplicationController
  def index
    @reviews = Review.ordered
  end
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if !@review.save
      render :new
    end

    if @review.save
      respond_to do |format|
        format.html { redirect_to movie_path(@review.movie.tmdb_id) }
        format.turbo_stream
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do  |format|
      format.html { redirect_to movie_path(@review.movie.tmdb_id) }
      format.turbo_stream
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :user_id, :movie_id)
  end
end

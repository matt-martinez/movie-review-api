class ReviewsController < ApplicationController

  def get_all
    render json: {users: User.all, movies: Movie.all, reviews: Review.all}
  end

  def index
    render json: Review.all
  end

  def show
    render json: Review.find(params[:id])
  end

  def create
    review = Review.new(review_params)

    if review.save
      render json: {status: 201, review: review}
      # render json: review, status: :created, location: review
    else
      render json: {status: 422}
      # render json: review.errors, status: :unprocessable_entity
    end
  end

  def update
    review = Review.find(params[:id])

    if review.update(review_params)
      render json: {status: 201, review: review}
    else
      render json: {status: 422}
    end
  end

  private

    def review_params
      params.require(:review).permit(:title, :rating, :comments, :user_id, :movie_id)
    end
end

class ReviewsController < ApplicationController
  def create
    @car = Car.find(params["car_id"])
    @review = Review.new(review_params)
    @review.car = @car
    # @reviews.car_id = @car.id (same as above)
    @review.save

    if @review.save
      redirect_to car_path(@car)
    else
      render 'cars/show', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end

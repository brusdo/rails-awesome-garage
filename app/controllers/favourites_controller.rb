class FavouritesController < ApplicationController
  def index
    @favourite = Favourite.all
  end

  def create
    @favourite = Favourite.new
    @car = Car.find(params[:car_id])
    @favourite.car = @car

    if @favourite.save
      redirect_to car_path(@car)
    else
      render 'car/show', status: :unprocessable_entity
    end
  end

  def destroy
    @favourite = Favourite.find_by(params[:id])
    @favourite.destroy
    redirect_to favourites_path, status: :see_other
  end
end

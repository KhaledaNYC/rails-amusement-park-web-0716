class RidesController < ApplicationController
  def create
    @ride=Ride.create(user_id:params[:user_id], attraction_id:params[:attraction_id])
    message=@ride.take_ride
    flash[:notice] = message
    redirect_to user_path(params[:user_id])
  end

  def show
    @ride = Ride.find(params[:id])
  end
end

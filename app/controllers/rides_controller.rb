class RidesController < ApplicationController
  def create

  end

  def show
    @ride = Ride.find(params[:id])
  end
end

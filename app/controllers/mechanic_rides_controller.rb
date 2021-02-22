class MechanicRidesController < ApplicationController

  def create
    @ride = Ride.find(params[:ride_id])
    @mechanic = Mechanic.find(params[:id])
    @mechanic_rides = MechanicRide.create(ride: @ride, mechanic: @mechanic)
      redirect_to "/mechanics/#{@mechanic.id}"
  end
end

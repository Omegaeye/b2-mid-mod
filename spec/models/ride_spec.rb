require 'rails_helper'

RSpec.describe Ride, type: :model do
  # before :each do
  #   @andrew = Mechanic.create!(name: "Andrew", years_experience: 10)
  #   @jake = Mechanic.create!(name: "Jake", years_experience: 7)
  #
  #   @doom = Ride.create!(name: "Doom", thrill_rating: 6, open: false)
  #   @spinner = Ride.create!(name: "Spinner", thrill_rating: 8, open: false)
  #   @dropper = Ride.create!(name: "Dropper", thrill_rating: 4, open: false)
  #
  #   MechanicRide.create!(mechanic: @andrew, ride: @doom)
  #   MechanicRide.create!(mechanic: @jake, ride: @doom)
  #   MechanicRide.create!(mechanic: @andrew, ride: @spinner)
  #   MechanicRide.create!(mechanic: @jake, ride: @dropper)
  # end

  it {should have_many(:mechanics).through(:mechanic_rides)}
  it {should have_many(:mechanic_rides)}
end

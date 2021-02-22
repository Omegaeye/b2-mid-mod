require 'rails_helper'

RSpec.describe 'Mechanics Index page' do
  before :each do
    Mechanic.destroy_all
    Ride.destroy_all
    MechanicRide.destroy_all
    @awesome = AmusementPark.create!(name: "Awesome Land", price: 50.00)
    @andrew = Mechanic.create!(name: "Andrew", years_experience: 10)
    @jake = Mechanic.create!(name: "Jake", years_experience: 7)

    @doom = @awesome.rides.create!(name: "Doom", thrill_rating: 6, open: true)
    @spinner = @awesome.rides.create!(name: "Spinner", thrill_rating: 8, open: true)
    @dropper = @awesome.rides.create!(name: "Dropper", thrill_rating: 4, open: true)

    MechanicRide.create!(mechanic: @andrew, ride: @doom)
    MechanicRide.create!(mechanic: @jake, ride: @doom)
    MechanicRide.create!(mechanic: @andrew, ride: @spinner)
    MechanicRide.create!(mechanic: @jake, ride: @dropper)
  end

  it "Mechanic Index page display all contents" do
  visit '/mechanics'

  expect(page).to have_content("All Mechanics")
  expect(page).to have_content(@andrew.name)
  expect(page).to have_content(@jake.years_experience)
  expect(page).to have_content("Average Years of Experience of all Mechanics")
  expect(page).to have_content(8.5)
  end
end

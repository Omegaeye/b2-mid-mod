require 'rails_helper'

RSpec.describe 'Amusement Park Show page' do
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

  it " Should have name and attributes plus rides" do
    visit "/amusement_parks/#{@awesome.id}"

    expect(page).to have_content(@awesome.name)
    expect(page).to have_content(@awesome.price)
    expect(page).to have_content("Doom")
    expect(page).to have_content("Spinner")
    expect(page).to have_content("Dropper")
    expect(page).to have_content("Average Thrill Rating of Rides:")
    expect(page).to have_content(@awesome.average_thrill)
    expect(page).to have_content(@awesome.price)
  end

end

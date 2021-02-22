require 'rails_helper'

RSpec.describe 'Mechanics Show page' do
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

  it "Mechanic show page show name and attributes" do
    visit "/mechanics/#{@andrew.id}"

    expect(page).to have_content("Andrew")
    expect(page).to have_content("10")
    expect(page).to have_content("Rides Working On:")
    expect(page).to have_content("Doom")
    expect(page).to have_content("Spinner")

    expect(page).to have_button("Add a Job")
    fill_in :ride_id, with:"#{@dropper.id}"
    click_button("Add a Job")
    expect(current_path).to eq("/mechanics/#{@andrew.id}")
    expect(page).to have_content("Dropper")
  end

end

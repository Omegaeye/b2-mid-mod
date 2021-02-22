# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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

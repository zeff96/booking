# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#   
# db/seeds.rb

# cities = [
#   {
#     name: "Nairobi",
#     timezone: "Africa/Nairobi",
#     booking_open: true,
#   },
#   {
#     name: "Kisumu",
#     timezone: "Africa/Nairobi",
#     booking_open: true,
#   },
#   {
#     name: "Mombasa",
#     timezone: "Africa/Nairobi",
#     booking_open: true,
#   },
#   {
#     name: "Nakuru",
#     timezone: "Africa/Nairobi",
#     booking_open: true,
#   },
#   {
#     name: "Eldoret",
#     timezone: "Africa/Nairobi",
#     booking_open: true,
#   },
#   {
#     name: "Kakamega",
#     timezone: "Africa/Nairobi",
#     booking_open: true,
#   }
# ]

# cities.each do |city_attributes|
#   City.find_or_create_by!(name: city_attributes[:name]) do |city|
#     city.timezone = city_attributes[:timezone]
#     city.booking_open = city_attributes[:booking_open]
#   end
# end



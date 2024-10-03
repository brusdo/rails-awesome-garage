# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# The other matters: destroy children to then destroy the parent
Review.destroy_all
Favourite.destroy_all
Car.destroy_all
Owner.destroy_all

# Start creating the parent
owner_1 = Owner.create!(nickname: "ElonM")
owner_2 = Owner.create!(nickname: "RonW")
owner_3 = Owner.create!(nickname: "SenaA")

car_1 = Car.create!(brand: "Tesla", model: "Model 3", year: 2024, fuel: "Unleaded petrol", owner: owner_1)
car_2 = Car.create!(brand: "Nissan", model: "Rogue", year: 2017, fuel: "Unleaded petrol", owner: owner_2)
car_3 = Car.create!(brand: "BMW", model: "X3", year: 2023, fuel: "Diesel", owner: owner_3)

Review.create!(comment: "Nice car!", rating: 5, car: car_1)
Review.create!(comment: "It is okay-ish", rating: 2, car: car_2)
Review.create!(comment: "It is fast!", rating: 4, car: car_3)

puts "Seed created! #{Owner.all.count} owners created and #{Car.all.count} created"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Performer.create(name: "Arsenal")
# Performer.create(name: "Nottingham Forest")

# Venue.create(name: "Emirates",
#              city: "London",
#              country: "UK",
#              capacity: 60_000,
#              image_url: "app/assets/images/emirates.jpeg")

Event.create(date: Date.new(2022, 10, 30), name: "Arsenal v Forest", venue_id: 1)

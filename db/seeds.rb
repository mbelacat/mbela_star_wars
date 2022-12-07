# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


response = JSON.parse(StarWars::Api.get_people)
characters = response["results"]

characters.each do |char|
 # planet_id = char["homeworld"] => I create a service so I just need Id
  characters.create(
    name: char["name"],
    mass: char["mass"]
    # homeworld: StarWars::Api.get_people(planet_id)
  )
end

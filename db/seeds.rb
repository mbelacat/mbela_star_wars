# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

characters = JSON.parse(StarWars::ApiClientService.get("https://swapi.dev/api/people"))
chars_above_75 = characters["results"].select { |char| char["mass"].to_i > 75 }

chars_above_75.each do |char|
  planet =  JSON.parse(StarWars::ApiClientService.get(char["homeworld"]))["name"]
  film = JSON.parse(StarWars::ApiClientService.get(char["film"]))["film"]
  Character.create(
    name: char["name"],
    mass: char["mass"],
    homeworld: planet
  )
end

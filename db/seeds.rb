# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pry'
require 'rest-client'
require 'json'


def get_fish
    response = RestClient.get("https://www.fishwatch.gov/api/species")
    fishdata = JSON.parse(response)

    new_fish_data = fishdata.map do |fish|
            {
                species_name: fish["Species Name"],
                scientific_name: fish["Scientific Name"],
                location: fish["Location"],
                habitat: fish["Habitat"],
                species_illustration_photo: fish["Species Illustration Photo"]
            }
        end   
        
    
    new_fish_data.each_with_index do |fish, index|
        if index < 25
        Fish.create(
            species_name: fish[:species_name],
            scientific_name: fish[:scientific_name],
            habitat: fish[:habitat],
            location: fish[:location],
            species_illustration_photo: fish[:species_illustration_photo]
        )
        
        end
    end
end
        
    
   
    get_fish


# Octopus = Fish.create( species_name:"Octopus", scientific_name:"Scientific Octopus", habitat:"the Ocean", location:"Around",
#      species_illustration_photo:"Image here")

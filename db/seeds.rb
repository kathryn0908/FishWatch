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

response = RestClient.get("https://www.fishwatch.gov/api/species")
    fishdata = JSON.parse(response)

def get_fish_species_name
    response = RestClient.get("https://www.fishwatch.gov/api/species")
    fishdata = JSON.parse(response)
    
    fishes = fishdata
    
    fishes.map do |fish|
    species_name = fish["Species Name"]
    species_name
    end
end

def get_fish_scientific_name
    response = RestClient.get("https://www.fishwatch.gov/api/species")
    fishdata = JSON.parse(response)
    
    fishes = fishdata
    
    fishes.map do |fish|
    scientific_name = fish["Scientific Name"]
    scientific_name
    end
end

def get_fish_location
    response = RestClient.get("https://www.fishwatch.gov/api/species")
    fishdata = JSON.parse(response)
    
    fishes = fishdata
    
    fishes.map do |fish|
    location = fish["Location"]
    location
        byebug
    end
end 

def get_fish_habitat
    response = RestClient.get("https://www.fishwatch.gov/api/species")
    fishdata = JSON.parse(response)
    
    fishes = fishdata
    
    fishes.map do |fish|
    habitat = fish["Habitat"]
    habitat
        byebug
    end
end

def get_fish_illustration
    response = RestClient.get("https://www.fishwatch.gov/api/species")
    fishdata = JSON.parse(response)
    
    fishes = fishdata
    
    fishes.map do |fish|
    illustration = fish["Species Illustration Photo"]
    illustration
    end
end

get_fish_illustration
get_fish_habitat
get_fish_species_name
get_fish_scientific_name

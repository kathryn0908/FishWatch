
require 'pry'
require 'rest-client'
require 'json'
# require_relative '/MOD2_PROJECT/fish_api/app/controllers/fish_controller.rb'


def get_fish
    response = RestClient.get("https://www.fishwatch.gov/api/species")
    fishdata = JSON.parse(response)

    new_fish_data = fishdata.map do |fish|
            {
                species_name: fish["Species Name"],
                scientific_name: fish["Scientific Name"],
                location: fish["Location"],
                habitat: fish["Habitat"],
                species_illustration_photo: fish["Species Illustration Photo"]["src"]
                
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

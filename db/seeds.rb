
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
                species_illustration_photo: fish["Species Illustration Photo"]["src"]
                
            }
            
        end  
       

        
    
    new_fish_data.each_with_index do |fish, index|
        if index < 100
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




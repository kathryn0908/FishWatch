class CreateFish < ActiveRecord::Migration[6.0]
  def change
    create_table :fish do |t|
      t.string :species_name
      t.string :scientific_name
      t.text :habitat
      t.text :location
      t.string :species_illustration_photo

      t.timestamps
    end
  end
end

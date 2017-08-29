class CreateAlienSightings < ActiveRecord::Migration[5.1]
  def change
    create_table :alien_sightings do |t|
      t.date :date_posted
      t.string :city
      t.string :state
      t.string :country
      t.string :shape
      t.integer :duration_in_seconds
      t.text :comments
      t.float :latitude
      t.float :longitude
      
      t.timestamps
    end
  end
end

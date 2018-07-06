class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :name
      t.integer :num_of_beds
      t.float :price_per_night
      t.integer :num_of_bath
      t.integer :num_of_rooms
      t.string :wifi
      t.string :kitchen
      t.string :washer
      t.string :dryer
      t.string :iron
      t.string :hair_dryer
      t.string :country
      t.string :state
      t.string :city
      t.string :resident
      t.string :poscode
      t.string :street
      t.string :house_number
      t.belongs_to :user
      t.timestamps
    end
  end
end

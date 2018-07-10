class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
    t.string :name
      t.integer :num_of_beds
      t.float :price_per_night
      t.integer :num_of_bath
      t.integer :num_of_rooms
      t.string :wifi,default:"no"
      t.string :kitchen,default:"no"
      t.string :washer,default:"no"
      t.string :dryer,default:"no"
      t.string :iron,default:"no"
      t.string :hair_dryer,default:"no"
      t.string :country
      t.string :state
      t.string :city
      t.string :resident
      t.string :poscode
      t.string :street
      t.json :image
      t.string :house_number
      t.string :status,default:"pending"
      t.belongs_to :user
      t.belongs_to :sort
      t.timestamps
    end
  end
end

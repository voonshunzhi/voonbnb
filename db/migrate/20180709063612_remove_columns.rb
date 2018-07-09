class RemoveColumns < ActiveRecord::Migration[5.2]
  def change
  	remove_column :listings, :wifi, :string
  	remove_column :listings, :kitchen, :string
  	remove_column :listings, :washer, :string
  	remove_column :listings, :dryer, :string
  	remove_column :listings, :iron, :string
  	remove_column :listings, :hair_dryer, :string
  	add_column :listings,:amenities,:string
  end
end

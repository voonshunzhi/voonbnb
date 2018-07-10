class AddColumnToListings < ActiveRecord::Migration[5.2]
  def change
  	add_column :listings,:amenities,:json
  end
end

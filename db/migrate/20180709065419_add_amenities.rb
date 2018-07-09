class AddAmenities < ActiveRecord::Migration[5.2]
  def change
  	add_column :listings,:amenities,:string
  end
end

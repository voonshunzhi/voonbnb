class RemoveThenAddColumn < ActiveRecord::Migration[5.2]
  def change
  	remove_column :listings,:amenities,:string
  end
end

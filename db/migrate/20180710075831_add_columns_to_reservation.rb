class AddColumnsToReservation < ActiveRecord::Migration[5.2]
  def change
  	add_column :reservations,:total_price,:float
  	add_column :reservations,:days,:integer
  end
end

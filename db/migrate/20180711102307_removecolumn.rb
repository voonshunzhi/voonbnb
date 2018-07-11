class Removecolumn < ActiveRecord::Migration[5.2]
  def change
  	remove_column :reservations,:payment_status,:integer
  end
end

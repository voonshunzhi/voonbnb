class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :check_in_date
      t.date :check_out_date
      t.integer :payment_status
      t.integer :user_id
      t.integer :listing_id

      t.timestamps
    end
  end
end

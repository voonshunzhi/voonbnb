class CreateSorts < ActiveRecord::Migration[5.2]
  def change
    create_table :sorts do |t|
      t.string :sort

      t.timestamps
    end
  end
end

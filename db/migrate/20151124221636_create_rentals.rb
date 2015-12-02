class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :product_id
      t.integer :line_item_id
      t.date :start_date

      t.timestamps null: false
    end
  end
end

class CreateRentalLocations < ActiveRecord::Migration
  def change
    create_table :rental_locations do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end

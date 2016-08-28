class AddShippingNameToRentalLocations < ActiveRecord::Migration
  def change
    add_column :rental_locations, :shipping_name, :string
  end
end

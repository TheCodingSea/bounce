class AddSaleIdToRentalLocations < ActiveRecord::Migration
  def change
    add_column :rental_locations, :sale_id, :integer
  end
end

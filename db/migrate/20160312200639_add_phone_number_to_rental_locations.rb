class AddPhoneNumberToRentalLocations < ActiveRecord::Migration
  def change
    add_column :rental_locations, :phone, :string
  end
end

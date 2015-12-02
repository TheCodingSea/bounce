class AddRentalIdToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :rental_id, :integer
  end
end

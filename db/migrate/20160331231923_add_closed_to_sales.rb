class AddClosedToSales < ActiveRecord::Migration
  def change
    add_column :sales, :closed, :boolean, default: false
  end
end

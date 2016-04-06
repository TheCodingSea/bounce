class RemoveStatusFromSales < ActiveRecord::Migration
  def change
    remove_column :sales, :status, :string
  end
end

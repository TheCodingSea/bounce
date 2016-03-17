class AddCompletedAtToSales < ActiveRecord::Migration
  def change
    add_column :sales, :completed_at, :datetime
  end
end

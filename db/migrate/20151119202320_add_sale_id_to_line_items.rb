class AddSaleIdToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :sale_id, :integer
  end
end

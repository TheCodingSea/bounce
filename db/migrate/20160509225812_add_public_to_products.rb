class AddPublicToProducts < ActiveRecord::Migration
  def change
    add_column :products, :publicized, :boolean
  end
end

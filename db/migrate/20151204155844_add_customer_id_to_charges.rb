class AddCustomerIdToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :customer_id, :string
  end
end

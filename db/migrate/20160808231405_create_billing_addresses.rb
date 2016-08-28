class CreateBillingAddresses < ActiveRecord::Migration
  def change
    create_table :billing_addresses do |t|
      t.string :billing_name
      t.string :address_1
      t.string :city
      t.string :state
      t.string :zip
      t.integer :sale_id

      t.timestamps null: false
    end
  end
end

class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.decimal :subtotal, precision: 5, scale: 2
      t.decimal :tax, precision: 5, scale: 2
      t.decimal :total, precision: 5, scale: 2

      t.timestamps null: false
    end
  end
end

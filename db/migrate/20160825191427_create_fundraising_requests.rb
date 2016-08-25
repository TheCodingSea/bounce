class CreateFundraisingRequests < ActiveRecord::Migration
  def change
    create_table :fundraising_requests do |t|
      t.string :name
      t.string :organization_name
      t.string :email
      t.datetime :event_date
      t.text :comments

      t.timestamps null: false
    end
  end
end

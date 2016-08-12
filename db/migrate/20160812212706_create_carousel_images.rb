class CreateCarouselImages < ActiveRecord::Migration
  def change
    create_table :carousel_images do |t|
      t.string :name
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at

      t.timestamps null: false
    end
  end
end

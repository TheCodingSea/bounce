class AddCaptionToCarouselImages < ActiveRecord::Migration
  def change
    add_column :carousel_images, :caption, :string
  end
end

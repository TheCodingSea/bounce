require 'rails_helper'

RSpec.describe "carousel_images/edit", type: :view do
  before(:each) do
    @carousel_image = assign(:carousel_image, CarouselImage.create!(
      :name => "MyString",
      :photo_file_name => "MyString",
      :photo_content_type => "MyString",
      :photo_file_size => 1
    ))
  end

  it "renders the edit carousel_image form" do
    render

    assert_select "form[action=?][method=?]", carousel_image_path(@carousel_image), "post" do

      assert_select "input#carousel_image_name[name=?]", "carousel_image[name]"

      assert_select "input#carousel_image_photo_file_name[name=?]", "carousel_image[photo_file_name]"

      assert_select "input#carousel_image_photo_content_type[name=?]", "carousel_image[photo_content_type]"

      assert_select "input#carousel_image_photo_file_size[name=?]", "carousel_image[photo_file_size]"
    end
  end
end

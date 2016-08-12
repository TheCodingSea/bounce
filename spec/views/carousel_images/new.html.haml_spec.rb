require 'rails_helper'

RSpec.describe "carousel_images/new", type: :view do
  before(:each) do
    assign(:carousel_image, CarouselImage.new(
      :name => "MyString",
      :photo_file_name => "MyString",
      :photo_content_type => "MyString",
      :photo_file_size => 1
    ))
  end

  it "renders new carousel_image form" do
    render

    assert_select "form[action=?][method=?]", carousel_images_path, "post" do

      assert_select "input#carousel_image_name[name=?]", "carousel_image[name]"

      assert_select "input#carousel_image_photo_file_name[name=?]", "carousel_image[photo_file_name]"

      assert_select "input#carousel_image_photo_content_type[name=?]", "carousel_image[photo_content_type]"

      assert_select "input#carousel_image_photo_file_size[name=?]", "carousel_image[photo_file_size]"
    end
  end
end

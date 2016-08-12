require 'rails_helper'

RSpec.describe "carousel_images/index", type: :view do
  before(:each) do
    assign(:carousel_images, [
      CarouselImage.create!(
        :name => "Name",
        :photo_file_name => "Photo File Name",
        :photo_content_type => "Photo Content Type",
        :photo_file_size => 1
      ),
      CarouselImage.create!(
        :name => "Name",
        :photo_file_name => "Photo File Name",
        :photo_content_type => "Photo Content Type",
        :photo_file_size => 1
      )
    ])
  end

  it "renders a list of carousel_images" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Photo File Name".to_s, :count => 2
    assert_select "tr>td", :text => "Photo Content Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

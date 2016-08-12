require 'rails_helper'

RSpec.describe "carousel_images/show", type: :view do
  before(:each) do
    @carousel_image = assign(:carousel_image, CarouselImage.create!(
      :name => "Name",
      :photo_file_name => "Photo File Name",
      :photo_content_type => "Photo Content Type",
      :photo_file_size => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Photo File Name/)
    expect(rendered).to match(/Photo Content Type/)
    expect(rendered).to match(/1/)
  end
end

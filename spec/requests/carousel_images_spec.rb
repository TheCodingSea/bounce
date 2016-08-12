require 'rails_helper'

RSpec.describe "CarouselImages", type: :request do
  describe "GET /carousel_images" do
    it "works! (now write some real specs)" do
      get carousel_images_path
      expect(response).to have_http_status(200)
    end
  end
end

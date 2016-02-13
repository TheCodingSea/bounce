require 'rails_helper'

RSpec.describe "RentalLocations", type: :request do
  describe "GET /rental_locations" do
    it "works! (now write some real specs)" do
      get rental_locations_path
      expect(response).to have_http_status(200)
    end
  end
end

require 'rails_helper'

RSpec.describe "FundraisingRequests", type: :request do
  describe "GET /fundraising_requests" do
    it "works! (now write some real specs)" do
      get fundraising_requests_path
      expect(response).to have_http_status(200)
    end
  end
end

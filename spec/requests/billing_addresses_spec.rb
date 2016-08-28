require 'rails_helper'

RSpec.describe "BillingAddresses", type: :request do
  describe "GET /billing_addresses" do
    it "works! (now write some real specs)" do
      get billing_addresses_path
      expect(response).to have_http_status(200)
    end
  end
end

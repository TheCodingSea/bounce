require "rails_helper"

RSpec.describe BillingAddressesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/billing_addresses").to route_to("billing_addresses#index")
    end

    it "routes to #new" do
      expect(:get => "/billing_addresses/new").to route_to("billing_addresses#new")
    end

    it "routes to #show" do
      expect(:get => "/billing_addresses/1").to route_to("billing_addresses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/billing_addresses/1/edit").to route_to("billing_addresses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/billing_addresses").to route_to("billing_addresses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/billing_addresses/1").to route_to("billing_addresses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/billing_addresses/1").to route_to("billing_addresses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/billing_addresses/1").to route_to("billing_addresses#destroy", :id => "1")
    end

  end
end

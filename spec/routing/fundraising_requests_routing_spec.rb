require "rails_helper"

RSpec.describe FundraisingRequestsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fundraising_requests").to route_to("fundraising_requests#index")
    end

    it "routes to #new" do
      expect(:get => "/fundraising_requests/new").to route_to("fundraising_requests#new")
    end

    it "routes to #show" do
      expect(:get => "/fundraising_requests/1").to route_to("fundraising_requests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fundraising_requests/1/edit").to route_to("fundraising_requests#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/fundraising_requests").to route_to("fundraising_requests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/fundraising_requests/1").to route_to("fundraising_requests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/fundraising_requests/1").to route_to("fundraising_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fundraising_requests/1").to route_to("fundraising_requests#destroy", :id => "1")
    end

  end
end

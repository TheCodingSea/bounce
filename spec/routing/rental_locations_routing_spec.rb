require "rails_helper"

RSpec.describe RentalLocationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rental_locations").to route_to("rental_locations#index")
    end

    it "routes to #new" do
      expect(:get => "/rental_locations/new").to route_to("rental_locations#new")
    end

    it "routes to #show" do
      expect(:get => "/rental_locations/1").to route_to("rental_locations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rental_locations/1/edit").to route_to("rental_locations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rental_locations").to route_to("rental_locations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rental_locations/1").to route_to("rental_locations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rental_locations/1").to route_to("rental_locations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rental_locations/1").to route_to("rental_locations#destroy", :id => "1")
    end

  end
end

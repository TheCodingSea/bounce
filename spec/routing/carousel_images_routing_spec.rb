require "rails_helper"

RSpec.describe CarouselImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/carousel_images").to route_to("carousel_images#index")
    end

    it "routes to #new" do
      expect(:get => "/carousel_images/new").to route_to("carousel_images#new")
    end

    it "routes to #show" do
      expect(:get => "/carousel_images/1").to route_to("carousel_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/carousel_images/1/edit").to route_to("carousel_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/carousel_images").to route_to("carousel_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/carousel_images/1").to route_to("carousel_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/carousel_images/1").to route_to("carousel_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/carousel_images/1").to route_to("carousel_images#destroy", :id => "1")
    end

  end
end

require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  describe "GET #index" do
    it "assigns products as @products" do
      get :index
      expect(assigns[:products]).to eq Product.all
    end

    it "renders index" do
      get :index
      expect(response).to render_template "index"
    end
  end

end

require 'rails_helper'

RSpec.describe CheckoutController, type: :controller do
  let(:sale) { create :sale }

  before(:each) { allow(Sale).to receive(:find_by_id).and_return sale }

  describe "GET #cart" do
    it "assigns the sale" do
      get :cart
      expect(assigns(:sale)).to eq sale
    end

    it "builds a new rental location" do
      expect(RentalLocation).to receive(:new)
      get :cart
    end

    it "renders new_checkout" do
      get :cart
      expect(response).to render_template "cart"
    end
  end

  describe "GET #review_and_pay" do
    let!(:rental_location) { create :rental_location, sale: sale }

    it "assigns the sale" do
      get :review_and_pay
      expect(assigns(:sale)).to eq sale
    end

    it "assigns the rental location" do
      get :review_and_pay
      expect(assigns(:rental_location)).to eq rental_location
    end

    it "renders review_and_pay" do
      get :review_and_pay
      expect(response).to render_template "review_and_pay"
    end
  end

  describe "GET #thank_you" do
    fit "assigns the sale" do
      get :thank_you
      expect(assigns(:sale)).to eq sale
    end

    it "renders thank_you"
  end
end

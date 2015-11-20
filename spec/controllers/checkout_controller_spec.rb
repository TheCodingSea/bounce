require 'rails_helper'

RSpec.describe CheckoutController, type: :controller do
  let(:sale) { create :sale }

  before(:each) { allow(Sale).to receive(:find_by_id).and_return sale }

  describe "GET #new" do
    it "assigns the sale" do
      get :new
      expect(assigns(:sale)).to eq sale
    end

    it "renders new_checkout" do
      get :new
      expect(response).to render_template "new"
    end
  end
end

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:product) { create :product }

  before(:each) do
    allow(controller).to receive :authenticate_user!
  end

  describe "GET #index" do
    it "assigns all products as @products" do
      get :index
      expect(assigns(:products)).to eq([product])
    end
  end

  describe "GET #public" do
    it "assigns all products as @products" do
      get :public
      expect(assigns(:products)).to eq([product])
    end
  end

  describe "GET #show" do
    it "assigns the requested product as @product" do
      get :show, id: product.to_param
      expect(assigns(:product)).to eq(product)
    end

    it "assigns all rentals as @rentals" do
      get :show, id: product.to_param
      expect(assigns(:rentals)).to eq product.rentals
    end
  end

  describe "GET #new" do
    it "assigns a new product as @product" do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe "GET #edit" do
    it "assigns the requested product as @product" do
      get :edit, id: product.to_param
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, product: attributes_for(:product)
        }.to change(Product, :count).by(1)
      end

      it "assigns a newly created product as @product" do
        post :create, product: attributes_for(:product)
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to be_persisted
      end

      it "redirects to the created product" do
        post :create, product: attributes_for(:product)
        expect(response).to redirect_to(Product.last)
      end
    end

    context "with invalid params" do
      before(:each) do
        allow_any_instance_of(Product).to receive(:save).and_return(false)
      end

      it "assigns a newly created but unsaved product as @product" do
        post :create, product: attributes_for(:product)
        expect(assigns(:product)).to be_a_new(Product)
      end

      it "re-renders the 'new' template" do
        post :create, product: attributes_for(:product)
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) {
      { name: "New Name" }
    }

    context "with valid params" do
      it "updates the requested product" do
        expect_any_instance_of(Product).to receive(:update).with(new_attributes)
        put :update, id: product.to_param, product: new_attributes
      end

      it "assigns the requested product as @product" do
        put :update, id: product.to_param, product: new_attributes
        expect(assigns(:product)).to eq(product)
      end

      it "redirects to the product" do
        put :update, id: product.to_param, product: new_attributes
        expect(response).to redirect_to(product)
      end
    end

    context "with invalid params" do
      before(:each) do
        allow_any_instance_of(Product).to receive(:update).and_return(false)
      end

      it "assigns the product as @product" do
        put :update, id: product.to_param, product: new_attributes
        expect(assigns(:product)).to eq(product)
      end

      it "re-renders the 'edit' template" do
        put :update, id: product.to_param, product: new_attributes
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested product" do
      expect_any_instance_of(Product).to receive(:destroy)
      delete :destroy, id: product.to_param
    end

    it "redirects to the products list" do
      delete :destroy, id: product.to_param
      expect(response).to redirect_to(products_url)
    end
  end

end

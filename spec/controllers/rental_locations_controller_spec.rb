require 'rails_helper'

RSpec.describe RentalLocationsController, type: :controller do
  let(:rental_location) { create :rental_location }

  describe "GET #index" do
    before :each do
      allow(controller).to receive(:authenticate_user!)
    end

    it "assigns all rental_locations as @rental_locations" do
      get :index
      expect(assigns(:rental_locations)).to eq([rental_location])
    end
  end

  describe "GET #show" do
    it "assigns the requested rental_location as @rental_location" do
      get :show, id: rental_location.to_param
      expect(assigns(:rental_location)).to eq(rental_location)
    end
  end

  describe "GET #new" do
    it "assigns a new rental_location as @rental_location" do
      get :new
      expect(assigns(:rental_location)).to be_a_new(RentalLocation)
    end
  end

  describe "GET #edit" do
    it "assigns the requested rental_location as @rental_location" do
      get :edit, id: rental_location.to_param
      expect(assigns(:rental_location)).to eq(rental_location)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new RentalLocation" do
        expect {
          post :create, rental_location: attributes_for(:rental_location)
        }.to change(RentalLocation, :count).by(1)
      end

      it "assigns a newly created rental_location as @rental_location" do
        post :create, rental_location: attributes_for(:rental_location)
        expect(assigns(:rental_location)).to be_a(RentalLocation)
        expect(assigns(:rental_location)).to be_persisted
      end

      it "sets the sale" do
        sale = create :sale
        allow(controller).to receive(:current_sale).and_return sale
        allow(RentalLocation).to receive(:new).and_return rental_location
        post :create, rental_location: attributes_for(:rental_location)
        expect(rental_location.sale).to eq sale
      end

      it "redirects to review_and_pay" do
        post :create, rental_location: attributes_for(:rental_location)
        expect(response).to redirect_to review_and_pay_path
      end

      xit "redirects to the created rental_location" do
        post :create, rental_location: attributes_for(:rental_location)
        expect(response).to redirect_to(RentalLocation.last)
      end
    end

    context "with invalid params" do
      before :each do
        allow_any_instance_of(RentalLocation).to receive(:save).and_return false
      end

      it "assigns a newly created but unsaved rental_location as @rental_location" do
        post :create, rental_location: attributes_for(:rental_location)
        expect(assigns(:rental_location)).to be_a_new(RentalLocation)
      end

      it "re-renders the 'cart' template" do
        post :create, rental_location: attributes_for(:rental_location)
        expect(response).to render_template("checkout/cart")
      end

      xit "re-renders the 'new' template" do
        post :create, rental_location: attributes_for(:rental_location)
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested rental_location" do
        expect_any_instance_of(RentalLocation).to receive(:update)
        put :update, id: rental_location.to_param, rental_location: attributes_for(:rental_location)
      end

      it "assigns the requested rental_location as @rental_location" do
        put :update, id: rental_location.to_param, rental_location: attributes_for(:rental_location)
        expect(assigns(:rental_location)).to eq(rental_location)
      end

      it "redirects to review_and_pay" do
        put :update, id: rental_location.to_param, rental_location: attributes_for(:rental_location)
        expect(response).to redirect_to review_and_pay_path
      end

      xit "redirects to the rental_location" do
        put :update, id: rental_location.to_param, rental_location: attributes_for(:rental_location)
        expect(response).to redirect_to(rental_location)
      end
    end

    context "with invalid params" do
      before :each do
        allow_any_instance_of(RentalLocation).to receive(:update).and_return false
      end

      it "assigns the rental_location as @rental_location" do
        put :update, id: rental_location.to_param, rental_location: attributes_for(:rental_location)
        expect(assigns(:rental_location)).to eq(rental_location)
      end

      it "re-renders the 'cart' template" do
        put :update, id: rental_location.to_param, rental_location: attributes_for(:rental_location)
        expect(response).to render_template("checkout/cart")
      end

      xit "re-renders the 'edit' template" do
        put :update, id: rental_location.to_param, rental_location: attributes_for(:rental_location)
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      allow(controller).to receive(:authenticate_user!)
    end

    it "destroys the requested rental_location" do
      expect_any_instance_of(RentalLocation).to receive :destroy
      delete :destroy, id: rental_location.to_param
    end

    it "redirects to the rental_locations list" do
      delete :destroy, id: rental_location.to_param
      expect(response).to redirect_to(rental_locations_url)
    end
  end

end

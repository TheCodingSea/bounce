require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  let(:line_item) { create :line_item }

  describe "GET #index" do
    it "assigns all line_items as @line_items" do
      get :index
      expect(assigns(:line_items)).to eq([line_item])
    end
  end

  describe "GET #show" do
    it "assigns the requested line_item as @line_item" do
      get :show, id: line_item.to_param
      expect(assigns(:line_item)).to eq(line_item)
    end
  end

  describe "GET #new" do
    it "assigns a new line_item as @line_item" do
      get :new
      expect(assigns(:line_item)).to be_a_new(LineItem)
    end
  end

  describe "GET #edit" do
    it "assigns the requested line_item as @line_item" do
      get :edit, id: line_item.to_param
      expect(assigns(:line_item)).to eq(line_item)
    end
  end

  describe "POST #create" do
    let(:date_attributes) { { "date(3i)" => "1", "date(2i)" => "1",
                              "date(1i)" => "2020" } }
    it "sets current sale" do
      post :create, line_item: attributes_for(:line_item), rental: date_attributes
      expect(assigns(:sale)).to be_a(Sale)
    end

    context "with valid params" do
      it "assigns a newly created line_item as @line_item" do
        post :create, line_item: attributes_for(:line_item), rental: date_attributes
        expect(assigns(:line_item)).to be_a(LineItem)
      end

      it "creates a new LineItem" do
        expect_any_instance_of(LineItem).to receive(:save)
        post :create, line_item: attributes_for(:line_item), rental: date_attributes
      end

      it "creates a rental" do
        allow(LineItem).to receive(:new).and_return line_item
        expect(Rental).to receive(:create).
          with(line_item_id: line_item.id, product_id: line_item.product_id,
               start_date: a_kind_of(Date))
        post :create, line_item: attributes_for(:line_item), rental: date_attributes
      end

      it "saves the sale" do
        allow_any_instance_of(LineItem).to receive(:save).and_return true
        expect_any_instance_of(Sale).to receive(:save)
        post :create, line_item: attributes_for(:line_item), rental: date_attributes
      end

      it "redirects to the cart" do
        allow_any_instance_of(LineItem).to receive(:save).and_return true
        post :create, line_item: attributes_for(:line_item), rental: date_attributes
        expect(response).to redirect_to(new_checkout_path)
      end
    end

    context "with invalid params" do
      before(:each) do
        allow_any_instance_of(LineItem).to receive(:valid?).and_return false
      end

      it "assigns a newly created but unsaved line_item as @line_item" do
        post :create, line_item: attributes_for(:line_item), rental: date_attributes
        expect(assigns(:line_item)).to be_a_new(LineItem)
      end

      it "re-renders the 'products/show' template" do
        post :create, line_item: attributes_for(:line_item), rental: date_attributes
        expect(response).to render_template("products/show")
      end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) {
      { product_id: 2 }
    }

    context "with valid params" do
      it "updates the requested line_item" do
        expect_any_instance_of(LineItem).to receive(:update)
        put :update, id: line_item.to_param, line_item: new_attributes
      end

      it "assigns the requested line_item as @line_item" do
        put :update, id: line_item.to_param, line_item: new_attributes
        expect(assigns(:line_item)).to eq(line_item)
      end

      it "redirects to the line_item" do
        put :update, id: line_item.to_param, line_item: new_attributes
        expect(response).to redirect_to(line_item)
      end
    end

    context "with invalid params" do
      it "assigns the line_item as @line_item" do
        put :update, id: line_item.to_param, line_item: new_attributes
        expect(assigns(:line_item)).to eq(line_item)
      end

      it "re-renders the 'edit' template" do
        allow_any_instance_of(LineItem).to receive(:update).and_return false
        put :update, id: line_item.to_param, line_item: new_attributes
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested line_item" do
      expect_any_instance_of(LineItem).to receive(:destroy)
        delete :destroy, id: line_item.to_param
    end

    it "redirects to the line_items list" do
      delete :destroy, id: line_item.to_param
      expect(response).to redirect_to(line_items_url)
    end
  end


end

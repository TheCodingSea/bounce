require 'rails_helper'

RSpec.describe Sale, type: :model do
  let(:sale) { create :sale, subtotal: nil, tax: nil, total: nil }

  describe "total!" do
    let!(:product) { create :product, price: 200.00 }
    let!(:line_item) { create :line_item, product: product, sale: sale }

    before(:each) do
      sale.total!
    end

    it "calculates subtotal" do
      expect(sale.subtotal).to eq product.price
    end

    it "adds transportation cost"

    it "calculates tax" do
      expect(sale.tax).to eq(product.price * 0.07)
    end

    it "calculates total" do
      expect(sale.total).to eq sale.subtotal + sale.tax
    end
  end
end

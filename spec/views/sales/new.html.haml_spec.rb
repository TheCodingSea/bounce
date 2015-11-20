require 'rails_helper'

RSpec.describe "sales/new", type: :view do
  before(:each) do
    assign(:sale, Sale.new(
      :subtotal => "9.99",
      :tax => "9.99",
      :total => "9.99"
    ))
  end

  it "renders new sale form" do
    render

    assert_select "form[action=?][method=?]", sales_path, "post" do

      assert_select "input#sale_subtotal[name=?]", "sale[subtotal]"

      assert_select "input#sale_tax[name=?]", "sale[tax]"

      assert_select "input#sale_total[name=?]", "sale[total]"
    end
  end
end

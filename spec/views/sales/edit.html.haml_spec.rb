require 'rails_helper'

RSpec.describe "sales/edit", type: :view do
  before(:each) do
    @sale = assign(:sale, Sale.create!(
      :subtotal => "9.99",
      :tax => "9.99",
      :total => "9.99"
    ))
  end

  it "renders the edit sale form" do
    render

    assert_select "form[action=?][method=?]", sale_path(@sale), "post" do

      assert_select "input#sale_subtotal[name=?]", "sale[subtotal]"

      assert_select "input#sale_tax[name=?]", "sale[tax]"

      assert_select "input#sale_total[name=?]", "sale[total]"
    end
  end
end

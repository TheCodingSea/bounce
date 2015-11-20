require 'rails_helper'

RSpec.describe "sales/index", type: :view do
  before(:each) do
    assign(:sales, [
      Sale.create!(
        :subtotal => "9.99",
        :tax => "9.99",
        :total => "9.99"
      ),
      Sale.create!(
        :subtotal => "9.99",
        :tax => "9.99",
        :total => "9.99"
      )
    ])
  end

  it "renders a list of sales" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end

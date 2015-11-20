require 'rails_helper'

RSpec.describe "line_items/index", type: :view do
  before(:each) do
    assign(:line_items, [
      LineItem.create!(
        :product_id => 1
      ),
      LineItem.create!(
        :product_id => 1
      )
    ])
  end

  it "renders a list of line_items" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

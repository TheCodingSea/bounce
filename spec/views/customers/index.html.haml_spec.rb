require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        :customer_id => "Customer",
        :email => "Email"
      ),
      Customer.create!(
        :customer_id => "Customer",
        :email => "Email"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", :text => "Customer".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end

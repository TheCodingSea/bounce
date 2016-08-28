require 'rails_helper'

RSpec.describe "billing_addresses/index", type: :view do
  before(:each) do
    assign(:billing_addresses, [
      BillingAddress.create!(
        :billing_name => "Billing Name",
        :address_1 => "",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :sale_id => 1
      ),
      BillingAddress.create!(
        :billing_name => "Billing Name",
        :address_1 => "",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :sale_id => 1
      )
    ])
  end

  it "renders a list of billing_addresses" do
    render
    assert_select "tr>td", :text => "Billing Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

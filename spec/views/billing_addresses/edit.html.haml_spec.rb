require 'rails_helper'

RSpec.describe "billing_addresses/edit", type: :view do
  before(:each) do
    @billing_address = assign(:billing_address, BillingAddress.create!(
      :billing_name => "MyString",
      :address_1 => "",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :sale_id => 1
    ))
  end

  it "renders the edit billing_address form" do
    render

    assert_select "form[action=?][method=?]", billing_address_path(@billing_address), "post" do

      assert_select "input#billing_address_billing_name[name=?]", "billing_address[billing_name]"

      assert_select "input#billing_address_address_1[name=?]", "billing_address[address_1]"

      assert_select "input#billing_address_city[name=?]", "billing_address[city]"

      assert_select "input#billing_address_state[name=?]", "billing_address[state]"

      assert_select "input#billing_address_zip[name=?]", "billing_address[zip]"

      assert_select "input#billing_address_sale_id[name=?]", "billing_address[sale_id]"
    end
  end
end

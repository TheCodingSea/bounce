require 'rails_helper'

RSpec.describe "billing_addresses/show", type: :view do
  before(:each) do
    @billing_address = assign(:billing_address, BillingAddress.create!(
      :billing_name => "Billing Name",
      :address_1 => "",
      :city => "City",
      :state => "State",
      :zip => "Zip",
      :sale_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Billing Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip/)
    expect(rendered).to match(/1/)
  end
end

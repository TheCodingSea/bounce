require 'rails_helper'

RSpec.describe "customers/edit", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :customer_id => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do

      assert_select "input#customer_customer_id[name=?]", "customer[customer_id]"

      assert_select "input#customer_email[name=?]", "customer[email]"
    end
  end
end

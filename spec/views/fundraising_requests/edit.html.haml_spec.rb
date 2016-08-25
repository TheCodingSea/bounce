require 'rails_helper'

RSpec.describe "fundraising_requests/edit", type: :view do
  before(:each) do
    @fundraising_request = assign(:fundraising_request, FundraisingRequest.create!(
      :name => "MyString",
      :organization_name => "MyString",
      :email => "MyString",
      :comments => "MyText"
    ))
  end

  it "renders the edit fundraising_request form" do
    render

    assert_select "form[action=?][method=?]", fundraising_request_path(@fundraising_request), "post" do

      assert_select "input#fundraising_request_name[name=?]", "fundraising_request[name]"

      assert_select "input#fundraising_request_organization_name[name=?]", "fundraising_request[organization_name]"

      assert_select "input#fundraising_request_email[name=?]", "fundraising_request[email]"

      assert_select "textarea#fundraising_request_comments[name=?]", "fundraising_request[comments]"
    end
  end
end

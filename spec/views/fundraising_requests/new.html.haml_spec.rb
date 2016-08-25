require 'rails_helper'

RSpec.describe "fundraising_requests/new", type: :view do
  before(:each) do
    assign(:fundraising_request, FundraisingRequest.new(
      :name => "MyString",
      :organization_name => "MyString",
      :email => "MyString",
      :comments => "MyText"
    ))
  end

  it "renders new fundraising_request form" do
    render

    assert_select "form[action=?][method=?]", fundraising_requests_path, "post" do

      assert_select "input#fundraising_request_name[name=?]", "fundraising_request[name]"

      assert_select "input#fundraising_request_organization_name[name=?]", "fundraising_request[organization_name]"

      assert_select "input#fundraising_request_email[name=?]", "fundraising_request[email]"

      assert_select "textarea#fundraising_request_comments[name=?]", "fundraising_request[comments]"
    end
  end
end

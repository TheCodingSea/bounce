require 'rails_helper'

RSpec.describe "fundraising_requests/index", type: :view do
  before(:each) do
    assign(:fundraising_requests, [
      FundraisingRequest.create!(
        :name => "Name",
        :organization_name => "Organization Name",
        :email => "Email",
        :comments => "MyText"
      ),
      FundraisingRequest.create!(
        :name => "Name",
        :organization_name => "Organization Name",
        :email => "Email",
        :comments => "MyText"
      )
    ])
  end

  it "renders a list of fundraising_requests" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Organization Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "fundraising_requests/show", type: :view do
  before(:each) do
    @fundraising_request = assign(:fundraising_request, FundraisingRequest.create!(
      :name => "Name",
      :organization_name => "Organization Name",
      :email => "Email",
      :comments => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Organization Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/MyText/)
  end
end

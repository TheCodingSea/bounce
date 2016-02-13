require 'rails_helper'

RSpec.describe "rental_locations/edit", type: :view do
  before(:each) do
    @rental_location = assign(:rental_location, RentalLocation.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :address_1 => "MyString",
      :address_2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString"
    ))
  end

  it "renders the edit rental_location form" do
    render

    assert_select "form[action=?][method=?]", rental_location_path(@rental_location), "post" do

      assert_select "input#rental_location_first_name[name=?]", "rental_location[first_name]"

      assert_select "input#rental_location_last_name[name=?]", "rental_location[last_name]"

      assert_select "input#rental_location_address_1[name=?]", "rental_location[address_1]"

      assert_select "input#rental_location_address_2[name=?]", "rental_location[address_2]"

      assert_select "input#rental_location_city[name=?]", "rental_location[city]"

      assert_select "input#rental_location_state[name=?]", "rental_location[state]"

      assert_select "input#rental_location_zip[name=?]", "rental_location[zip]"
    end
  end
end

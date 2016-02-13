json.array!(@rental_locations) do |rental_location|
  json.extract! rental_location, :id, :first_name, :last_name, :address_1, :address_2, :city, :state, :zip
  json.url rental_location_url(rental_location, format: :json)
end

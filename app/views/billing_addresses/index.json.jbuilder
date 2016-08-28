json.array!(@billing_addresses) do |billing_address|
  json.extract! billing_address, :id, :billing_name, :address_1, :city, :state, :zip, :sale_id
  json.url billing_address_url(billing_address, format: :json)
end

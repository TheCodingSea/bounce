json.array!(@customers) do |customer|
  json.extract! customer, :id, :customer_id, :email
  json.url customer_url(customer, format: :json)
end

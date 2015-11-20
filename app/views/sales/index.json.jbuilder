json.array!(@sales) do |sale|
  json.extract! sale, :id, :subtotal, :tax, :total
  json.url sale_url(sale, format: :json)
end

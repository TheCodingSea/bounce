json.array!(@fundraising_requests) do |fundraising_request|
  json.extract! fundraising_request, :id, :name, :organization_name, :email, :event_date, :comments
  json.url fundraising_request_url(fundraising_request, format: :json)
end

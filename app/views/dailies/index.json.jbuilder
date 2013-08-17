json.array!(@dailies) do |daily|
  json.extract! daily, :pledge_id, :Push_date_id, :amount_backers_integer, :amount_pledged
  json.url daily_url(daily, format: :json)
end

json.array!(@dailies) do |daily|
  json.extract! daily, :project_id, :push_date_id, :amount_backers, :amount_pledged
  json.url daily_url(daily, format: :json)
end

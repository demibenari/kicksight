json.array!(@pledges) do |pledge|
  json.extract! pledge, :project_id, :min_amount, :description, :delivery_date
  json.url pledge_url(pledge, format: :json)
end

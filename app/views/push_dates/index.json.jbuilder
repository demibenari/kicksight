json.array!(@push_dates) do |push_date|
  json.extract! push_date, :push_date
  json.url push_date_url(push_date, format: :json)
end

json.array!(@users) do |user|
  json.extract! user, :email, :password
  json.url user_url(user, format: :json)
end

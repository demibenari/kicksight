json.array!(@projects) do |project|
  json.extract! project, :kick_id, :category_id, :name, :description, :goal, :expiration_date, :project_link, :picture_link, :video_link, :status_id
  json.url project_url(project, format: :json)
end

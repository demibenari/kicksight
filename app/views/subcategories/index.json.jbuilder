json.array!(@subcategories) do |subcategory|
  json.extract! subcategory, :description, :category_id
  json.url subcategory_url(subcategory, format: :json)
end

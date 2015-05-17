json.array!(@categories) do |category|
  json.extract! category, :id, :CategoryName
  json.url category_url(category, format: :json)
end

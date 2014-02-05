json.array!(@competitors) do |competitor|
  json.extract! competitor, :id, :name, :description, :url, :funding
  json.url competitor_url(competitor, format: :json)
end

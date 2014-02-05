json.array!(@ideas) do |idea|
  json.extract! idea, :id, :title, :description, :notes, :industry_id, :revenue_model_id
  json.url idea_url(idea, format: :json)
end

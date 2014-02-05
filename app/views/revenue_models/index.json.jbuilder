json.array!(@revenue_models) do |revenue_model|
  json.extract! revenue_model, :id, :title
  json.url revenue_model_url(revenue_model, format: :json)
end

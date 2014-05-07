json.array!(@product_models) do |product_model|
  json.extract! product_model, :id, :name, :active
  json.url product_model_url(product_model, format: :json)
end

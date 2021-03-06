json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :image, :price, :category_id
  json.url product_url(product, format: :json)
end

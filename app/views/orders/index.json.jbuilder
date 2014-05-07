json.array!(@orders) do |order|
  json.extract! order, :id, :user_id, :name, :email, :address, :document_number, :payment_type, :special_id, :subtotal, :discount
  json.url order_url(order, format: :json)
end

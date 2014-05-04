json.array!(@product_users) do |product_user|
  json.extract! product_user, :id, :product_id, :company_name, :company_message, :user_name, :job_title, :address, :phone, :email, :website
  json.url product_user_url(product_user, format: :json)
end

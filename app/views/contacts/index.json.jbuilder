json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :email, :document_number, :phone, :type_contact, :description, :user_id
  json.url contact_url(contact, format: :json)
end

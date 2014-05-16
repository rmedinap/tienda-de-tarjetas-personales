json.array!(@banners) do |banner|
  json.extract! banner, :id, :image, :link
  json.url banner_url(banner, format: :json)
end

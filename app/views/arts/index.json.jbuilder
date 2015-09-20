json.array!(@arts) do |art|
  json.extract! art, :id, :title, :body
  json.url art_url(art, format: :json)
end

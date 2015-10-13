json.array!(@pictures) do |picture|
  json.extract! picture, :id, :name, :title, :description, :address, :latitude, :longitude
  json.url picture_url(picture, format: :json)
end

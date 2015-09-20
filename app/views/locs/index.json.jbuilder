json.array!(@locs) do |loc|
  json.extract! loc, :id
  json.url loc_url(loc, format: :json)
end

json.array!(@events) do |event|
  json.extract! event, :id, :user_id, :title, :opendate, : opendate_memo, :postal, :address, :address_embed, :fee, :limit, :integer
  json.url event_url(event, format: :json)
end

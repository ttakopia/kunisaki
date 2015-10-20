json.array!(@reports) do |report|
  json.extract! report, :id, :event_id, :short_desc, :long_desc
  json.url report_url(report, format: :json)
end

json.array!(@servers) do |server|
  json.extract! server, :ip
  json.url server_url(server, format: :json)
end

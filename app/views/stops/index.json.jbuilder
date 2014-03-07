json.stops do |json|
  json.array!(@stops) do |stop|
    json.extract! stop, :name, :lat, :lon, :gtfs_stop_id 
    json.url stop_url(stop, format: :json)
  end
end

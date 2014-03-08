json.trips do |json|
  json.array!(@trips) do |trip|
    json.extract! trip,
    :gtfs_route_id,
    :gtfs_trip_id,
    :headsign,
    :short_name,
    :direction_id,
    :route_id
  end
end

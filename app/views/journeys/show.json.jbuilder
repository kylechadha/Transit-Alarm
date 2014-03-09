json.journey do |json|
  json.extract! @journey, :start_lat, :start_lon, :end_lat, :end_lon, :direction, :alert_distance, :alert_type, :id
end
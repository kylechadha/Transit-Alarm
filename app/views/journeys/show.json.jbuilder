json.journey do |json|
  json.extract! @journey, :end_lat, :end_lon, :direction, :alert_distance, :alert_type, :id
end
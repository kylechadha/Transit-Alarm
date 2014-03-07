json.routes do |json|
  json.array!(@routes) do |route|
    json.extract! route, :short_name, :long_name, :outbound, :inbound, :route_type, :gtfs_route_id, :gtfs_agency_id 
    json.url route_url(route, format: :json)
  end
end

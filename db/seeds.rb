# # Hi Friends, REMEMBER: When loading in data from other agencies, must check column names (to ensure the same number of columns)

# Agency.delete_all
# open("db/agency.txt") do |file|
#   file.read.each_line do |data|
#     gtfs_agency_id, name, url, timezone, lang, phone, fare_url = data.chomp.split(",")
#     Agency.create!(gtfs_agency_id: gtfs_agency_id, name: name, url: url, timezone: timezone, lang: lang, phone: phone, fare_url: fare_url)
#   end
# end

# Route.delete_all
# open("db/routes.txt") do |file|
#   file.read.each_line do |data|
#     # When loading in data from other agencies, must check column names (to ensure the same number of columns)
#     gtfs_route_id, gtfs_agency_id, short_name, long_name, route_type, url, color, text_color = data.chomp.split(",")
#     Route.create!(gtfs_route_id: gtfs_route_id, gtfs_agency_id: gtfs_agency_id, short_name: short_name, long_name: long_name, route_type: route_type, url: url, color: color, text_color: text_color)
#   end
# end

# # After exploring the possibility of calculting Route "Direction Headsigns" from the Trips model, incomplete data requires that we manually input this information

# headsigns = {
#   "1944" => { 0 => "To UCLA", 1 => "To Venice" },
#   "1945" => { 0 => "To UCLA", 1 => "To Santa Monica" },
#   "1946" => { 0 => "To Santa Monica / UCLA", 1 => "To Green Line Station" },
#   "1947" => { 0 => "To Westside Pavilion", 1 => "To Downtown Santa Monica" },
#   "1948" => { 0 => "To Expo Culver City Station", 1 => "Santa Monica" },
#   "1949" => { 0 => "To Palms", 1 => "To Santa Monica College" },
#   "1950" => { 0 => "To Rimpau Transit Center", 1 => "To Santa Monica" },
#   "1951" => { 0 => "To UCLA", 1 => "To Santa Monica" },
#   "1952" => { 0 => "To Pacific Palisades", 1 => "To Santa Monica" },
#   "1953" => { 0 => "To Downtown Los Angeles", 1 => "To Santa Monica" },
#   "1955" => { 0 => "To Expo Culver City Station", 1 => "To UCLA" },
#   "1956" => { 0 => "To Rimpau Transit Center", 1 => "To Westside Pavilion" },
#   "1957" => { 0 => "To Brentwood", 1 => "To Culver City" },
#   "1958" => { 0 => "To Expo Culver City Station", 1 => "To Santa Monica" },
#   "1959" => { 0 => "To Expo Culver City Station", 1 => "To UCLA" },
#   "1960" => { 0 => "To Santa Monica", 1 => "To LAX / Green Line Station" },
#   "1961" => { 0 => "To Metro Purple Station", 1 => "To Santa Monica" },
#   "1962" => { 0 => "Crosstown Ride" },
#   "1963" => { 0 => "Sunset Ride" }
# }

# Route.all.each do |route|
#   agency = Agency.find_by(gtfs_agency_id: route.gtfs_agency_id)
#   route.agency_id = agency.id

#   route.outbound = headsigns[route.gtfs_route_id][1]
#   route.inbound = headsigns[route.gtfs_route_id][0]
#   route.save
# end

# # Created shape ID as " " since there was an extra space in the file! >.<
# Trip.delete_all
# open("db/trips.txt") do |file|
#   file.read.each_line do |data|
#     gtfs_route_id, gtfs_service_id, gtfs_trip_id, headsign, direction_id, block_id, shape_id = data.chomp.split(",")
#     Trip.create!(gtfs_route_id: gtfs_route_id, gtfs_service_id: gtfs_service_id, gtfs_trip_id: gtfs_trip_id, headsign: headsign, direction_id: direction_id, block_id: block_id, shape_id: shape_id)
#   end
# end

# Trip.all.each do |trip|
#   route = Route.find_by(gtfs_route_id: trip.gtfs_route_id)
#   trip.route_id = route.id
#   trip.save
# end

# Stop.delete_all
# open("db/stops.txt") do |file|
#   file.read.each_line do |data|
#     gtfs_stop_id, code, name, desc, lat, lon, zone_id, url, location_type, parent_station = data.chomp.split(",")
#     Stop.create!(gtfs_stop_id: gtfs_stop_id, code: code, name: name, desc: desc, lat: lat, lon: lon, zone_id: zone_id, url: url, location_type: location_type, parent_station: parent_station)
#   end
# end

# StopTime.delete_all
# open("db/stop_times.txt") do |file|
#   file.read.each_line do |data|
#     gtfs_trip_id, arrival_time, departure_time, gtfs_stop_id, sequence, headsign, pickup_type, drop_off_type, shape_dist_traveled = data.chomp.split(",")
#     StopTime.create!(gtfs_trip_id: gtfs_trip_id, arrival_time: arrival_time, departure_time: departure_time, gtfs_stop_id: gtfs_stop_id, sequence: sequence, headsign: headsign, pickup_type: pickup_type, drop_off_type: drop_off_type, shape_dist_traveled: shape_dist_traveled)
#   end
# end

# StopTime.all.each do |stoptimes|
#   trip = Trip.find_by(gtfs_trip_id: stoptimes.gtfs_trip_id)
#   stoptimes.trip_id = trip.id

#   stop = Stop.find_by(gtfs_stop_id: stoptimes.gtfs_stop_id)
#   stoptimes.stop_id = stop.id

#   stoptimes.save
# end

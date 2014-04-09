class RoutesController < ApplicationController

  def index
    @routes = Route.all

    @stops = Stop.all
    @nearby = Stop.by_distance(origin: [params[:lat], params[:lon]]).limit(200)

    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  def show
    @route = Route.find(params[:id])
    @direction = params[:direction]

    # Find all the trips that are on the selected route, and in the selected direction
    trips = @route.trips.where(direction_id: params[:direction])

    # Store the count of stops (via stop_times) in hash with each trip
    trips_hash = {}
    trips.each do |trip|
      trips_hash[trip] = trip.stop_times.count
    end

    # Identify which trips have the most number of stops (and store it in an array since there are multiple)
    longest_trip = trips_hash.select{|k, v| v == trips_hash.values.max }

    # Select a random trip in the longest_trip array and store as @trip
    @trip = longest_trip.keys.sample

    # Calcs to determine which stops to display based on route, direction, and current location
    @starting_stop = Stop.by_distance(origin: [params[:lat], params[:lon]]).joins(:trips).where(trips: { id: @trip.id }).first

    # From the starting stop, we'll figure out what the remaining sequence of stops is
    starting_seq = StopTime.where(trip_id: @trip.id, stop_id: @starting_stop.id).first

    @remaining_stops = StopTime.where(trip_id: @trip.id).where("sequence >= ?", starting_seq.sequence).order('sequence ASC')
  end

  def list
    @routes = Route.all
  end

end

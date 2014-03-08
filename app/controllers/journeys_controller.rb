class JourneysController < ApplicationController

  def new
    @journey = Journey.new
  end

  def create
    @route = Route.find(params[:id])
    @direction = params[:direction]

    route = "Route #{@route.short_name}: #{@route.long_name}"
    headsign = @direction == "0" ? @route.inbound : @route.outbound

    binding.pry

    @journey = Journey.new(name: route, direction: headsign, start_lat: params[:lat], start_lon: params[:lon], trip_id: params[:trip])
    @journey.save

    if @journey.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

end

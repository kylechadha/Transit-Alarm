class JourneysController < ApplicationController

  def index
    @nearby = Stop.by_distance(origin: [params[:lat], params[:lon]]).joins(:trips).where(trips: { id: params[:trip] }).limit(1)

    respond_to do |format|
      format.js
    end
  end

  def new
    @journey = Journey.new
  end

  def create

    @route = Route.find(params[:journey][:route])
    @direction = params[:journey][:direction]

    route = "Route #{@route.short_name}: #{@route.long_name}"
    headsign = @direction == "0" ? @route.inbound : @route.outbound

    end_stop = Stop.find(params[:journey][:stop]).id
    end_lat = Stop.find(params[:journey][:stop]).lat
    end_lon = Stop.find(params[:journey][:stop]).lon

    @journey = Journey.new(name: route, direction: headsign, start_lat: params[:journey][:lat], start_lon: params[:journey][:lon], trip_id: params[:journey][:trip], stop_id: end_stop, end_lat: end_lat, end_lon: end_lon, alert_distance: params[:journey][:alert_distance], alert_type: params[:journey][:alert_type])

    if @journey.save
      redirect_to journey_path(@journey)
    else
      render action: 'new'
    end
  end

  def show
    @journey = Journey.find(params[:id])

    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  private
  def journey_params
    params.require(:journey).permit(:route, :direction, :alert_distance, :alert_type)
  end

end

class StopsController < ApplicationController

  def index
    @stops = Stop.all
    @nearby = Stop.by_distance(origin: [params[:lat], params[:lon]]).limit(16)

    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  def show
    @stop = Stop.find(params[:id])
  end
  
end

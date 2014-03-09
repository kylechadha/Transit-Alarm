require 'spec_helper'

describe RoutesController do

  context 'when format is JSON' do
    render_views
    it "index gives back all routes" do
      Route.create(gtfs_route_id: "1944",
      short_name: "1",
      long_name: "Santa Monica Blvd - Ucla",
      route_type: 3)
      get 'index', format: 'json'

      routes = JSON.parse(response.body)
      expect(routes.count).to eq(1)
    end

  it 'renders the correct fields for a route object in the JSON' do
      @route = Route.create(gtfs_route_id: "1944",
      short_name: "1",
      long_name: "Santa Monica Blvd - Ucla",
      route_type: 3)
      get 'index', format: 'json'

      routes = JSON.parse(response.body)['routes'][0]
      expect(routes['gtfs_route_id']).to eq @route.gtfs_route_id
      expect(routes['short_name']).to eq @route.short_name
      expect(routes['long_name']).to eq @route.long_name
      expect(routes['route_type']).to eq @route.route_type
    end
  end
end
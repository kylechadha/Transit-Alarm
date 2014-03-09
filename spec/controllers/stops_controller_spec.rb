require 'spec_helper'

describe StopsController do

  context 'when format is JSON' do
    render_views
    # Test Number One
    it "index gives back all stops" do
      Stop.create(gtfs_stop_id: "230",
      name: "Santa Monica Wb & Bundy Fs",
      lat: 33.9879239,
      lon: -118.4717181)
      get 'index', format: 'json'

      stops = JSON.parse(response.body)
      expect(stops.count).to eq(1)
    end

  it 'renders the correct fields for a Stop object in the JSON' do
      @stop = Stop.create(gtfs_stop_id: "230",
      name: "Santa Monica Wb & Bundy Fs",
      lat: 33.9879239,
      lon: -118.4717181)
      get 'index', format: 'json'

      stops = JSON.parse(response.body)['stops'][0]
      expect(stops['gtfs_stop_id']).to eq @stop.gtfs_stop_id
      expect(stops['name']).to eq @stop.name
      expect(stops['lat']).to eq @stop.lat
      expect(stops['lon']).to eq @stop.lon
      expect(stops['url']).to eq @stop.url

    end
  end
end
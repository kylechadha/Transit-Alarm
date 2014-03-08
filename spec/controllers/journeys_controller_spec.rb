require 'spec_helper'

describe JourneysController do

  context 'when format is JSON' do
    render_views

    it "returns only one journey in show" do
      @journey = Journey.create(end_lat: 34.014009, end_lon: -118.4977641, direction: "To Santa Monica", alert_distance: "0.5 miles", alert_type: "Alarm", id: 65)
      get 'show', format: 'json', id: @journey.id
      journey = JSON.parse(response.body)
      expect(journey.count).to eq(1)
    end
  

    it "renders the correct view information in show" do
      @journey = Journey.create(end_lat: 34.014009, end_lon: -118.4977641, direction: "To Santa Monica", alert_distance: "0.5 miles", alert_type: "Alarm", id: 65)
      get 'show', format: 'json', id: @journey.id

      journey = JSON.parse(response.body)['journey']
      expect(journey['id']).to eq @journey.id
      expect(journey['end_lat']).to eq @journey.end_lat
      expect(journey['end_lon']).to eq @journey.end_lon
      expect(journey['alert_type']).to eq @journey.alert_type
      expect(journey['alert_distance']).to eq @journey.alert_distance
      expect(journey['direction']).to eq @journey.direction
    end
  end

  context 'when format is HTML' do
    it 'it "gives me just the one drank we want on show"' do
      @journey = Journey.create(end_lat: 34.014009, end_lon: -118.4977641, direction: "To Santa Monica", alert_distance: "0.5 miles", alert_type: "Alarm", id: 65)
      get 'show', id: @journey.id, format: 'html'
      expect(response).to be_success
    end
  end
end
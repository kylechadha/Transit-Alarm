require 'spec_helper'

describe StopTime do

  before :each do
    @valid_attributes = {
      gtfs_trip_id: "582512",
      gtfs_stop_id: "389",
      sequence: 44
    }
  end

  describe 'validations' do

    context 'when gtfs_trip_id is missing' do
      it 'the record is not valid' do
        expect(StopTime.new(@valid_attributes.merge(gtfs_trip_id: nil))).not_to be_valid
      end
    end

    context 'when gtfs_stop_id is missing' do
      it 'the record is not valid' do
        expect(StopTime.new(@valid_attributes.merge(gtfs_stop_id: nil))).not_to be_valid
      end
    end

    context 'when sequence is missing' do
      it 'the record is not valid' do
        expect(StopTime.new(@valid_attributes.merge(sequence: nil))).not_to be_valid
      end
    end

    context 'when sequence is not an integer' do
      it 'the record is not valid' do
        expect(StopTime.new(@valid_attributes.merge(sequence: "fox"))).not_to be_valid
      end
    end

    context 'when all attributes are valid' do
      it 'the record is valid' do
        expect(StopTime.new(@valid_attributes)).to be_valid
      end
    end

  end

  describe 'relationships' do

    context '.trip' do
      it 'should belong to trip' do
        trip = Trip.create(gtfs_route_id: "1963", gtfs_trip_id: "583787", direction_id: 0)
        stoptime = StopTime.create(@valid_attributes.merge(trip_id: trip.id))
        expect(stoptime.trip).to eq(trip)
      end
    end

    context '.stop' do
      it 'should belong to stop' do
        stop = Stop.create(gtfs_stop_id: "230", name: "Santa Monica Wb & Bundy Fs", lat: 33.9879239, lon: -118.4717181)
        stoptime = StopTime.create(@valid_attributes.merge(stop_id: stop.id))
        expect(stoptime.stop).to eq(stop)
      end
    end

  end

end
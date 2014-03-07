require 'spec_helper'

describe Trip do

  before :each do
    @valid_attributes = {
      gtfs_route_id: "1963",
      gtfs_trip_id: "583787",
      direction_id: 0
    }
  end

  describe 'validations' do

    context 'when all attributes are valid' do
      it 'the record is valid' do
        expect(Trip.new(@valid_attributes)).to be_valid
      end
    end

    context 'when gtfs_route_id is missing' do
      it 'the record is not valid' do
        expect(Trip.new(@valid_attributes.merge(gtfs_route_id: nil))).not_to be_valid
      end
    end

    context 'when gtfs_trip_id is missing' do
      it 'the record is not valid' do
        expect(Trip.new(@valid_attributes.merge(gtfs_trip_id: nil))).not_to be_valid
      end
    end

    context 'when direction_id is missing' do
      it 'the record is not valid' do
        expect(Trip.new(@valid_attributes.merge(direction_id: nil))).not_to be_valid
      end
    end

    context 'when direction_id is not a boolean' do
      it 'the record is not valid' do
        expect(Trip.new(@valid_attributes.merge(direction_id: "fox"))).not_to be_valid
      end
    end

    # Would be good to do a test to validate whether ALL direction_ids are boolean (so, not contextual) 

  end

  describe 'relationships' do

    context '.route' do
      it 'should belong to route' do
        route = Route.create(gtfs_route_id: "1024", short_name: "19", long_name: "Awesome route number 19", route_type: 4)
        trip = Trip.create(@valid_attributes.merge(route_id: route.id))
        expect(trip.route).to eq(route)
      end
    end

    context '.stop_times' do
      it 'should have many stop_times' do
        trip = Trip.create(@valid_attributes)
        stoptime = StopTime.create(gtfs_trip_id: "582512", gtfs_stop_id: "389", sequence: 44, trip_id: trip.id)
        expect(trip.stop_times.last).to eq(stoptime)
      end
    end

  end

end
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

    # context 'when all attributes are valid' do
    #   it 'the record is valid' do
    #     expect(StopTime.new(@valid_attributes)).to be_valid
    #   end
    # end

  # describe 'relationships' do

  #   context '.route' do
  #     it 'should belong to route' do
  #       route = Route.create(gtfs_route_id: "1024", short_name: "19", long_name: "Awesome route number 19", route_type: 4)
  #       trip = Trip.create(@valid_attributes.merge(route_id: route.id))
  #       expect(trip.route).to eq(route)
  #     end
  #   end

    # context '.stop_times' do
    #   it 'should have many stop_times' do
    #     trip = Trip.create(@valid_attributes)
    #     stoptime = StopTime.create(trip_id: trip.id)
    #     expect(trip.stop_times.last).to eq(stoptime)
    #   end
    # end

  end

end
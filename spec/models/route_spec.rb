require 'spec_helper'

describe Route do

  before :each do
    @valid_attributes = {
      gtfs_route_id: "1944",
      short_name: "1",
      long_name: "Santa Monica Blvd - Ucla",
      route_type: 3
    }
  end

  describe 'validations' do

    context 'when all attributes are valid' do
      it 'the record is valid' do
        expect(Route.new(@valid_attributes)).to be_valid
      end
    end

    context 'when gtfs_route_id is missing' do
      it 'the record is not valid' do
        expect(Route.new(@valid_attributes.merge(gtfs_route_id: nil))).not_to be_valid
      end
    end

    context 'when short_name is missing' do
      it 'the record is not valid' do
        expect(Route.new(@valid_attributes.merge(short_name: nil))).not_to be_valid
      end
    end

    context 'when long_name is missing' do
      it 'the record is not valid' do
        expect(Route.new(@valid_attributes.merge(long_name: nil))).not_to be_valid
      end
    end

    context 'when route_type is missing' do
      it 'the record is not valid' do
        expect(Route.new(@valid_attributes.merge(route_type: nil))).not_to be_valid
      end
    end

  end

  describe 'relationships' do

    context '.agency' do
      it 'should belong to agency' do
        agency = Agency.create(gtfs_agency_id: "1024789")
        route = Route.create(@valid_attributes.merge(agency_id: agency.id))
        expect(route.agency).to eq(agency)
      end
    end

    context '.trips' do
      it 'should have many trips' do
        route = Route.create(@valid_attributes)
        trip = Trip.create(gtfs_route_id: "1963", gtfs_trip_id: "583787", direction_id: 0, route_id: route.id)
        expect(route.trips.last).to eq(trip)
      end
    end

  end

end
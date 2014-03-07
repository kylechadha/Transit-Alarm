require 'spec_helper'

describe Stop do

  before :each do
    @valid_attributes = {
      gtfs_stop_id: "230",
      name: "Santa Monica Wb & Bundy Fs",
      lat: 33.9879239,
      lon: -118.4717181
    }
  end

  describe 'validations' do

    context 'when gtfs_stop_id is missing' do
      it 'the record is not valid' do
        expect(Stop.new(@valid_attributes.merge(gtfs_stop_id: nil))).not_to be_valid
      end
    end

    context 'when name is missing' do
      it 'the record is not valid' do
        expect(Stop.new(@valid_attributes.merge(name: nil))).not_to be_valid
      end
    end

    context 'when lat is missing' do
      it 'the record is not valid' do
        expect(Stop.new(@valid_attributes.merge(lat: nil))).not_to be_valid
      end
    end

    context 'when lon is missing' do
      it 'the record is not valid' do
        expect(Stop.new(@valid_attributes.merge(lon: nil))).not_to be_valid
      end
    end

    context 'when lat is not a float' do
      it 'the record is not valid' do
        expect(Stop.new(@valid_attributes.merge(lat: "fox"))).not_to be_valid
      end
    end

    context 'when lon is not a float' do
      it 'the record is not valid' do
        expect(Stop.new(@valid_attributes.merge(lon: "fox"))).not_to be_valid
      end
    end

    context 'when all attributes are valid' do
      it 'the record is valid' do
        stop = Stop.new(@valid_attributes)
        expect(stop.valid?).to eq true
      end
    end

  end

  describe 'relationships' do

    context '.stop_times' do
      it 'should have many stop_times' do
        stop = Stop.create(@valid_attributes)
        stoptime = StopTime.create(gtfs_trip_id: "582512", gtfs_stop_id: "389", sequence: 44, stop_id: stop.id)
        expect(stop.stop_times.last).to eq(stoptime)
      end
    end

    context '.trips' do
      it 'should have many trips, through stop_times'
    end

  end

end
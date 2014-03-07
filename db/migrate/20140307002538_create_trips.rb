class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :gtfs_route_id
      t.string :gtfs_service_id
      t.string :gtfs_trip_id
      t.string :headsign
      t.string :short_name
      t.integer :direction_id
      t.string :block_id
      t.string :shape_id
      t.string :route_id
      t.references :route, index: true

      t.timestamps
    end
  end
end

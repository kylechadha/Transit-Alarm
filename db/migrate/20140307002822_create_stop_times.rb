class CreateStopTimes < ActiveRecord::Migration
  def change
    create_table :stop_times do |t|
      t.string :gtfs_trip_id
      t.string :arrival_time
      t.string :departure_time
      t.string :gtfs_stop_id
      t.integer :sequence
      t.string :headsign
      t.integer :pickup_type
      t.integer :drop_off_type
      t.float :shape_dist_traveled
      t.references :trip, index: true
      t.references :stop, index: true

      t.timestamps
    end
  end
end

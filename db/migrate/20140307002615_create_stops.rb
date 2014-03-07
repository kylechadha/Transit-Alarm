class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :gtfs_stop_id
      t.string :code
      t.string :name
      t.string :desc
      t.float :lat
      t.float :lon
      t.string :zone_id
      t.string :url
      t.string :location_type
      t.string :parent_station

      t.timestamps
    end
  end
end

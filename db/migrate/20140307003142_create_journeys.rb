class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
      t.string :name
      t.string :direction
      t.float :start_lat
      t.float :start_lon
      t.float :end_lat
      t.float :end_lon
      t.string :alert_distance
      t.string :alert_type
      t.references :user, index: true
      t.references :trip, index: true
      t.references :stop, index: true

      t.timestamps
    end
  end
end

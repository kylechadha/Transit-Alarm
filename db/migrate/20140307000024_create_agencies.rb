class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :gtfs_agency_id
      t.string :name
      t.string :url
      t.string :timezone
      t.string :lang
      t.string :phone
      t.string :fare_url

      t.timestamps
    end
  end
end

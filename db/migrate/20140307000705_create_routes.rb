class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :gtfs_route_id
      t.string :gtfs_agency_id
      t.string :short_name
      t.string :long_name
      t.string :desc
      t.integer :route_type
      t.string :url
      t.string :color
      t.string :text_color
      t.string :outbound
      t.string :inbound
      t.references :agency, index: true

      t.timestamps
    end
  end
end

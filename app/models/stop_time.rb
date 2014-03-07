class StopTime < ActiveRecord::Base

  # belongs_to :trip
  # belongs_to :stop

  validates :gtfs_trip_id, presence: true

end

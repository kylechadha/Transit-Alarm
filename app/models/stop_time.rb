class StopTime < ActiveRecord::Base

  belongs_to :trip
  belongs_to :stop

  validates :gtfs_trip_id, :gtfs_stop_id, :sequence, presence: true
  validates :sequence, numericality: true

end

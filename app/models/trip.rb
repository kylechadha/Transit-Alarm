class Trip < ActiveRecord::Base

  belongs_to :route
  has_many :stop_times

  validates :gtfs_route_id, :gtfs_trip_id, :direction_id, presence: true
  validates :direction_id, inclusion: {in: [0, 1]}

end

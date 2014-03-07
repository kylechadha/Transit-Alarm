class Stop < ActiveRecord::Base

  has_many :stop_times
  has_many :trips, through: :stop_times
  # has_many :routes, through: :trips

  validates :gtfs_stop_id, :name, :lat, :lon, presence: true
  validates :lat, :lon, numericality: true
  
  acts_as_mappable :lat_column_name => :lat,
                   :lng_column_name => :lon

end

class Stop < ActiveRecord::Base

  acts_as_mappable :lat_column_name => :lat,
                   :lng_column_name => :lon

  has_many :stop_times
  has_many :trips, through: :stop_times
  has_many :routes, through: :trips

end

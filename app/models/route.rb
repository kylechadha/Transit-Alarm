class Route < ActiveRecord::Base

  belongs_to :agency
  has_many :trips
  # has_many :stops, through: :trips

  validates :gtfs_route_id, :short_name, :long_name, :route_type, presence:true

end

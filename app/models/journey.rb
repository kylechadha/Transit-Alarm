class Journey < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
  belongs_to :stop
end

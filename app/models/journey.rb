class Journey < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
  belongs_to :stop

  def self.destination(id)
    Stop.find(id)
  end
end

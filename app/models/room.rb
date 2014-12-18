class Room < ActiveRecord::Base
  has_many :bookings
  attr_accessible :room_id, :name 
end

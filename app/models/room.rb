class Room < ActiveRecord::Base
  has_many :bookings, dependent: :destroy
  attr_accessible :room_id, :name 
end

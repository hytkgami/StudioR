class Booking < ActiveRecord::Base
  has_many :bookedMaterials
  has_many :materials, through: :bookedMaterials
  belongs_to :Room
  belongs_to :member

  attr_accessible :id, :member, :day, :from, :to, :room_id, :book_id
end

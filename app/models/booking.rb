class Booking < ActiveRecord::Base
  has_many :bookedMaterials
  has_many :materials, through: :bookedMaterials
  belongs_to :Room

  attr_accessible :id, :user_id, :day, :from, :to, :room_id, :book_id
end

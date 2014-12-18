class BookedMaterial < ActiveRecord::Base
  belongs_to :booking
  belongs_to :material
  attr_accessible :booking_id, :material_id
end

class Booking < ActiveRecord::Base
  has_many :bookedMaterials, dependent: :destroy
  has_many :materials, through: :bookedMaterials, dependent: :destroy
  belongs_to :Room
  belongs_to :member

  attr_accessible :id, :member, :day, :from, :to, :room_id, :book_id

  # クラスメソッド
  class << self
    def search(query)
      rel = order
      if query.present?
        rel = rel.where("book_id ?", query).limit(1)
        logger.debug("@booking: #{rel.id}")
      end
    end
  end
end

# coding: utf-8

class Booking < ActiveRecord::Base
  has_many :bookedMaterials, dependent: :destroy
  has_many :materials, through: :bookedMaterials, dependent: :destroy
  belongs_to :room
  belongs_to :member

  attr_accessible :id, :member, :day, :from, :to, :room_id, :book_id, :mflag

  # 空の値を受け付けない
  validates :from, presence: true, numericality: { less_than: :to, message: :invalid_start_time }
  # 終了時間は開始時間よりも遅い時間でないと受け付けない
  validates :to, presence: true, numericality: { greater_than: :from, message: :invalid_end_time }

  validate :check_day
  validate :check_unique

  # クラスメソッド
  class << self
    def search(query)
      rel = find_by_book_id(query)
    end
  end

  def check_day
    if day < Date.today
      errors.add(:day, :invalid)
    end
  end

  # 部屋と時間がかぶらないようにする
  def check_unique
    invalid_from = false
    invalid_to = false
    bookings = Booking.order
    bookings.each do |booking|
      if day == booking.day && room_id == booking.room_id
        if !(from < booking.from && to <= booking.to)
          invalid_to = true
        elsif !(from >= booking.to && to > booking.to)
          invalid_from = true
        end
      end
    end
    if invalid_from
      errors.add(:from, "が他の予約と重複します。")
    end
    if invalid_to
      errors.add(:to, "が他の予約と重複します。")
    end
  end
end

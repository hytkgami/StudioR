# coding: utf-8

class Booking < ActiveRecord::Base
  has_many :bookedMaterials, dependent: :destroy
  has_many :materials, through: :bookedMaterials, dependent: :destroy
  belongs_to :room
  belongs_to :member

  acts_as_paranoid
  attr_accessible :id, :member, :day, :from, :to, :room_id, :book_id, :mflag

  # 空の値を受け付けない
  validates :from, presence: true, numericality: { less_than: :to, message: :invalid_start_time }
  # 終了時間は開始時間よりも遅い時間でないと受け付けない
  validates :to, presence: true, numericality: { greater_than: :from, message: :invalid_end_time }

  validate :check_day
  validate :check_unique
  validate :check_time

  # クラスメソッド
  class << self
    def search(query)
      rel = find_by_book_id(query)
    end

    def get_reserved(day = Date.today)
      bookings = where(day: day)
      arr = Array.new(4){ Array.new(24){0} }
      bookings.each do |booking|
        for i in (booking.from)...(booking.to) do
          arr[booking.room_id - 1][i] = 1
        end
      end
      return arr
    end
  end

  def check_day
    if day < Date.today
      errors.add(:day, :invalid)
    end
  end

  def check_time
    if day == Date.today && from <= Time.now.hour
      errors.add(:from, :invalid)
    end

    if day == Date.today && to <= Time.now.hour
      errors.add(:to, :invalid)
    end
  end

  # 部屋と時間がかぶらないようにする
  def check_unique
    invalid_from = false
    invalid_to = false
    bookings = Booking.order
    bookings.each do |booking|
      if day == booking.day && room_id == booking.room_id
        if from < booking.from && to < booking.from
        elsif from >= booking.to && to > booking.to
        else
          invalid_from = true
          invalid_to = true
        end
      end
    end
    if invalid_from
      errors.add(:from)
    end
    if invalid_to
      errors.add(:to)
    end
  end
end

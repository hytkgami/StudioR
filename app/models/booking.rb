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

  # クラスメソッド
  class << self
    def search(query)
      rel = find_by_book_id(query)
    end

    # 日にち, 開始時刻, 終了時刻
    def search_available(query, start, finish)
      rel = where("day >= ?", query) # 入力された日付以降の予約 
      request = (start..finish) # 開始から終了までの範囲オブジェクト
      reserved = Array.new # 予約されている部屋の情報
      rel.each do |booking|
        if request.in?((booking.from)..(booking.to))
          reserved << booking.room_id
        end
      end
      arr = reserved.uniq # 重複を消去
      Room.where(id: arr)
    end
  end

  def check_day
    if day < Date.today
      errors.add(:day, :invalid)
    end
  end
end

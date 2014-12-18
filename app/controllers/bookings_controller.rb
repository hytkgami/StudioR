class BookingsController < ApplicationController
  # 予約詳細
  def show
  end

  # 新規予約
  def new
    @rooms = Room.order("id") # Roomオブジェクトを取り出す
    @materials = Material.order("id") # 同様
    @booking = Booking.new
    @booking.room_id = 1
  end

  # 新規予約登録
  def create
    @booking = Booking.new(params[:booking])
    if @booking.save
      redirect_to :root
    else
      render "new"
    end
  end

  # 予約キャンセル
  def destory
  end
end

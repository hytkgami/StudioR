# coding: utf-8

class Admin::BookingsController < Admin::Base
  # 一覧
  def index
    gon.reserved_table = Booking.get_reserved
    @bookings = Booking.with_deleted.order
  end

  # 予約キャンセル
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to :admin_bookings, notice: "#{@booking.book_id}を削除しました。"
  end
end

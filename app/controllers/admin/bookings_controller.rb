# coding: utf-8

class Admin::BookingsController < Admin::Base
  # 一覧
  def index
    @bookings = Booking.order
  end

  # 予約キャンセル
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to :root, notice: "予約をキャンセルしました。"
  end
end

# coding: utf-8

class BookingsController < ApplicationController
  # 予約詳細
  def show
    @booking = Booking.find(params[:id])
  end

  # 新規予約
  def new
    @rooms = Room.order("id") # Roomオブジェクトを取り出す
    @booking = Booking.new
    @booking.room_id = 1 # 最初からラジオボタンを選択状態に
    @booking.from = Time.now.hour
  end

  # 新規予約登録
  def create
    @booking = Booking.new(params[:booking])
    @booking.assign_attributes(book_id: SecureRandom.hex(4), member: @current_member)
    if @booking.save
      redirect_to @booking, notice: "予約を登録しました。" 
    else
      render "new"
    end
  end

  # 予約キャンセル
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to :root, notice: "予約をキャンセルしました。"
  end
end

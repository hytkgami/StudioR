# coding: utf-8

class BookingsController < ApplicationController
  # 検索
  def search
    @booking = Booking.search(params[:q])
    if @booking
      redirect_to @booking
    else
      redirect_to :root, notice: "該当する予約はありませんでした。"
    end
  end

  # 予約可能な部屋を検索
  # def search_available
    # @rooms = Booking.search_available(params[:q], params[:start], params[:finish])
  # end

  # 予約詳細
  def show
    @booking = Booking.find(params[:id])
  end

  # 新規予約
  def new
    @rooms = Room.order("id") # Roomオブジェクトを取り出す
    @booking = Booking.new
    @booking.room_id = 1 # 最初からラジオボタンを選択状態に
  end

  # 新規予約登録
  def create
    @rooms = Room.order("id") # Roomオブジェクトを取り出す
    @booking = Booking.new(params[:booking])
    @booking.assign_attributes(book_id: SecureRandom.hex(4), member: @current_member)
    # 機材予約チェックボックスがtrueならば
    if @booking.mflag
      session[:booking] = @booking
      if @booking.save
        redirect_to @booking, notice: "部屋の予約を登録しました。"
      else
        render "new"
      end
    else
      if @booking.save
        redirect_to @booking, notice: "予約を登録しました。" 
      else
       render "new"
      end
    end
  end

  # 予約キャンセル
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to :root, notice: "予約をキャンセルしました。"
  end
end

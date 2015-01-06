# coding: utf-8

class BookingsController < ApplicationController
  # 検索
  def search
    session[:book_id] = params[:q]
    @booking = Booking.search(params[:q])
    if @booking
      redirect_to @booking
    else
      redirect_to :root, notice: "該当する予約はありませんでした。"
    end
  end

  # 予約詳細
  def show
    logger.debug(session)
    @book_id = session[:book_id] if session[:book_id]
    @booking = Booking.find(params[:id])
    material_array = BookedMaterial.where(booking_id: @booking.id).map(&:material_id)
    @materials = Material.where(id: material_array)
  end

  # 新規予約
  def new
    @bookings = Booking.where("day = ?", Time.now)
    @rooms = Room.order # Roomオブジェクトを取り出す
    @booking = Booking.new
    @booking.room_id = 1 # 最初からラジオボタンを選択状態に
  end

  # 新規予約登録
  def create
    @rooms = Room.order("id") # Roomオブジェクトを取り出す
    @booking = Booking.new(params[:booking])
    @book_id = SecureRandom.hex(4).to_s
    @booking.assign_attributes(book_id: @book_id, member: @current_member)
    session[:book_id] = @book_id
    session[:booking] = @booking
    # 機材予約チェックボックスがtrueならば
    if @booking.mflag
      if @booking.save
        redirect_to :new_booked_Material, notice: "部屋の予約を登録しました。"
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
    session[:booking].delete; session[:book_id].delete
    redirect_to :root, notice: "予約をキャンセルしました。"
  end
end

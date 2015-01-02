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

  # 予約可能な部屋を検索
  def search_available
    if params[:date]
      year = params[:date][:year]
      month = params[:date][:month]
      day = params[:date][:day]
    else
      year = Time.now.year.to_i
      month = Time.now.month.to_i
      day = Time.now.day.to_i
    end

    @date = Time.mktime(year, month, day)
    @rooms = Booking.search_available(@date, params[:start].to_i, params[:finish].to_i)
  end

  # 予約詳細
  def show
    logger.debug(session)
    @book_id = session[:book_id] if session[:book_id]
    @booking = Booking.find(params[:id])
  end

  # 新規予約
  def new
    @rooms = Room.order # Roomオブジェクトを取り出す
    @booking = Booking.new
    @booking.room_id = 1 # 最初からラジオボタンを選択状態に
  end

  # 新規予約登録
  def create
    @rooms = Room.order("id") # Roomオブジェクトを取り出す
    @booking = Booking.new(params[:booking])
    @book_id = @booking.assign_attributes(book_id: SecureRandom.hex(4).to_s, member: @current_member)
    session[:book_id] = @book_id
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

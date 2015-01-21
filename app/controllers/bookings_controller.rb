# coding: utf-8

class BookingsController < ApplicationController
  # 検索
  def search
    session[:book_id] = params[:q]
    @booking = Booking.search(params[:q])
    if @booking
      redirect_to @booking
    else
      redirect_to :root, notice: "#{params[:q]}に該当する予約はありませんでした。" if params[:q] != ""
      redirect_to :root, notice: "該当する予約はありませんでした。" if params[:q] == ""
    end
  end

  def search_available
    p params
    day = Date.new(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
    arr = Booking.get_reserved(day)
    id = [1,2,3,4]
    arr.each_index do |idx|
      (params[:from].to_i).upto(params[:to].to_i) do |i|
        if arr[idx][i] == 1
         id.delete_at(idx)
         break
        end
      end
    end
    @rooms = Room.where(id: id)
    @default_from = params[:from]
    @default_to = params[:to]
    @default_date = params[:day]
    @booking = Booking.new
    gon.reserved_table = Booking.get_reserved
    render "new"
  end

  # 予約詳細
  def show
    logger.debug(session)
    @book_id = session[:book_id] if session[:book_id]
    @booking = Booking.find(params[:id])
    material_array = BookedMaterial.where(booking_id: @booking.id).map(&:material_id)
    @materials = Material.where(id: material_array).order("kind_id")
  end

  # 新規予約
  def new
    @default_from = Time.now.hour + 1
    @default_to = Time.now.hour + 2
    @default_date = Date.today
    gon.reserved_table = Booking.get_reserved
    @rooms = Room.order # Roomオブジェクトを取り出す
    @booking = Booking.new
    @booking.room_id = 1 # 最初からラジオボタンを選択状態に
  end

  # 新規予約登録
  def create
    gon.reserved_table = Booking.get_reserved
    @rooms = Room.order("id") # Roomオブジェクトを取り出す
    @booking = Booking.new(params[:booking])
    @book_id = SecureRandom.hex(4).to_s
    @booking.assign_attributes(book_id: @book_id, member: @current_member)
    session[:book_id] = @book_id
    session[:booking] = @booking
    # 機材予約チェックボックスがtrueならば
    if @booking.mflag
      if @booking.save
        redirect_to :new_booked_Material, notice: "予約したい機材を選択してください。"
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
    redirect_to :root, notice: "#{@booking.day.strftime("%Y年%m月%d日")}の予約をキャンセルしました。"
  end
end

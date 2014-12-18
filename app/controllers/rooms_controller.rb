class RoomsController < ApplicationController
  # 部屋検索
  def index
    @rooms = Room.order("room_id") # Roomオブジェクトを取り出す
  end
end

# coding: utf-8

class RoomsController < ApplicationController
  def index
    @rooms = Room.order # Roomオブジェクトを取り出す
  end
end

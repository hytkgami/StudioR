# coding: utf-8

class TopController < ApplicationController
  def index
    gon.reserved_table = Booking.get_reserved
  end

  def login
  end
end

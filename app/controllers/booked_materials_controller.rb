# coding: utf-8

class BookedMaterialsController < ApplicationController
  def new
    @materials = Material.order("kind_id")
  end

  def create
    @booking = session[:booking]
    query = params[:materials]
    query.each do |q|
      if q[:flag] == '1'
        @booked_material = BookedMaterial.new(booking_id: @booking.id, material_id: q[:id].to_i)
        @booked_material.save
      end
    end
    redirect_to @booking, notice: "機材を予約しました。"
  end
end

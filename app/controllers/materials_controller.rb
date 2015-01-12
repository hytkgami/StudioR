class MaterialsController < ApplicationController
  def index
    @materials = Array.new
    1.upto(9) do |i|
      @materials << Material.where(kind_id: i)
    end
  end

  def show
    @material = Material.find(params[:id])
    if params[:format].in?(["jpg", "png", "gif"])
      send_image
    else
      render "materials/show"
    end
  end

  private
  # 画像送信
  def send_image
    if @material.image.present?
      send_data @material.image.data,
        type: @material.image.content_type, disposition: "inline"
    else
      raise NotFound
    end
  end
end

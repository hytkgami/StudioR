class MaterialsController < ApplicationController
  def index
    @materials = Material.order
  end

  def show
    @material = Material.find(params[:id])
  end
end

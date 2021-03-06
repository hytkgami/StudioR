# coding: utf-8

class Admin::MaterialsController < Admin::Base 
  def index
    @materials = Material.with_deleted.order("kind_id")
  end

  def show
    @material = Material.find(params[:id])
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(params[:material])
    if @material.save
      redirect_to @material, notice: "機材を登録しました。"
    else
      render "new"
    end
  end

  def edit
    @kinds = MaterialKind.order
    @material = Material.find(params[:id])
    @material.build_image unless @material.image
  end
  
  def update
    @material = Material.find(params[:id])
    @material.assign_attributes(params[:material])
    if @material.save
      redirect_to @material, notice: "機材情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @material = Material.find(params[:id])
    @material.destroy
    redirect_to :admin_materials, notice: "#{@material.name}を使用不可にしました。"
  end

  def recover
    @material = Material.with_deleted.find(params[:id])
    @material.recover
    redirect_to :admin_materials, notice: "#{@material.name}を使用可能にしました。"
  end
end

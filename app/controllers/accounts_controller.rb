# coding: utf-8

class AccountsController < ApplicationController
  # ログインしていないと会員ページから弾かれる
  before_filter :login_required

  # 会員は自分の情報を見ることができる
  def show
    @member = @current_member
    @bookings = Booking.where(member_id: @member.id).order("id DESC")
  end

  def edit
    @member = @current_member
  end

  def update
    @member = @current_member
    @member.assign_attributes(params[:member])
    if @member.save
      redirect_to :account, notice: "アカウント情報を更新しました。"
    else
      render "edit"
    end
  end

  # 会員は退会できる
  def destroy
    @member = @current_member
    @member.destroy
    redirect_to :root, notice: "退会しました。"
  end
end

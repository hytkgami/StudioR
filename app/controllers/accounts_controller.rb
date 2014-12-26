# coding: utf-8

class AccountsController < ApplicationController
  # ログインしていないと会員ページから弾かれる
  before_filter :login_required

  # 会員は自分の情報を見ることができる
  def show
    @member = @current_member
    @bookings = Booking.where(member_id: @member.id).order("id DESC")
  end

  # 会員は退会できる
  def destroy
  end
end

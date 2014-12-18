# coding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize

  class Forbidden < StandardError; end

  private
  # セッションが存在すれば,@current_memberにオブジェクトを入れる
  def authorize
    if session[:user_id]
      @current_member = Member.find_by_id(session[:user_id])
      session.delete(:member_id) unless @current_member
    end
  end

  # 会員以外を弾くメソッド
  def login_required
    raise Forbidden unless @current_member
  end
end
